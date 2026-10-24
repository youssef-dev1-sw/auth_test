import 'dart:async';

import 'package:auth_test/handle/error_handle.dart';
import 'package:auth_test/local/storage_token.dart';
import 'package:auth_test/models/loginrequest.dart';
import 'package:auth_test/providers/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends AsyncNotifier {
  @override
  FutureOr<dynamic> build() {
    return null;
  }

  Future loginUser(Loginrequest body) async {
    state = AsyncLoading();
    try {
      final storage = StorageToken();
      final serv = ref.read(servLoginProvider);
      final reponse = await serv.login(body: body);
      await storage.saveToken(reponse.access_token);
      state = AsyncValue.data(reponse);
    } on DioException catch (e, stackTrace) {
      final expection = ErrorHandle.handle(e);
      state = AsyncValue.error(expection, stackTrace);
    } catch (e, stackTrace) {
      state = AsyncValue.error("Unexpected error", stackTrace);
    }
  }
}
