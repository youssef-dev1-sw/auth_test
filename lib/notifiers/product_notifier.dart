
import 'dart:async';

import 'package:auth_test/models/product_request.dart';
import 'package:auth_test/providers/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

class ProductNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> productUser(ProductRequest body) async {
    state = const AsyncLoading();

    try {
      await ref.read(productServProvider).productUser(body: body);

      state = const AsyncData(null);
    } on DioException catch (e, stackTrace) {
      print('Status Code: ${e.response?.statusCode}');
      print('Response Data: ${e.response?.data}');

      state = AsyncError(e, stackTrace);
      rethrow;
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      rethrow;
    }
  }
}
