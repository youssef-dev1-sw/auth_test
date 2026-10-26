import 'package:auth_test/notifiers/product_notifier.dart';
import 'package:auth_test/services/product_serv.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProductProvider = Provider<Dio>((ref) {
  return Dio( BaseOptions(
      headers: {
        'apikey': 'sb_publishable_rzKmTCWxrZ3EokTjS2CFrg_e9Mip4pD',
        'Content-Type': 'application/json',
      },
    ),);
});

final productServProvider = Provider<ProductServ>((ref) {
  return ProductServ(ref.read(dioProductProvider));
});

final productNotifierProvider =
    AsyncNotifierProvider.autoDispose<ProductNotifier, void>(
      ProductNotifier.new,
    );
