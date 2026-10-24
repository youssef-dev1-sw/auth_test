import 'package:auth_test/notifiers/auth_notifier.dart';
import 'package:auth_test/services/login_serv.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      headers: {
        'apikey': 'sb_publishable_rzKmTCWxrZ3EokTjS2CFrg_e9Mip4pD',
        'Content-Type': 'application/json',
      },
    ),
  );
});

final servLoginProvider = Provider<LoginServ>((ref) {
  final dio = ref.read(dioProvider);
  return LoginServ(dio);
});

final authNotifierProvider =
    AsyncNotifierProvider<AuthNotifier, dynamic>(
  AuthNotifier.new,
);
