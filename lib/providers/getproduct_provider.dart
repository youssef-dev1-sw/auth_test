import 'package:auth_test/models/getproduct_model.dart';
import 'package:auth_test/notifiers/getproduct_notifier.dart';
import 'package:auth_test/providers/product_provider.dart';
import 'package:auth_test/services/getproduct_serv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProvider = Provider<GetproductServ>((ref) {
  return GetproductServ(ref.read(dioProductProvider));
});

final getNotifierProvider =
    AsyncNotifierProvider.autoDispose<
      GetproductNotifier,
      List<GetproductModel>
    >(GetproductNotifier.new);
