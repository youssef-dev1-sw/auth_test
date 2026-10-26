
import 'dart:async';

import 'package:auth_test/models/loginrequest.dart';
import 'package:auth_test/providers/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegestirNotifier extends AsyncNotifier<dynamic> {
  @override
  FutureOr<dynamic> build() {
    return null;
  }

  Future<void> regestirUser(Loginrequest body) async {
    state = const AsyncLoading();

    try {
      final serv = ref.read(registerProvider);

      final respond = await serv.regestir(body: body);

      print('Register response: $respond');

      state = AsyncData(respond);
    } on DioException catch (e, stackTrace) {
      print('Status code: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');

      state = AsyncError(
        e.response?.data ?? e.message ?? 'Request failed',
        stackTrace,
      );
    } catch (e, stackTrace) {
      print('Unexpected register error: $e');

      state = AsyncError(e, stackTrace);
    }
  }
}
