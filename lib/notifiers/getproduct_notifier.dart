import 'dart:async';

import 'package:auth_test/models/getproduct_model.dart';
import 'package:auth_test/providers/getproduct_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetproductNotifier extends AsyncNotifier<List<GetproductModel>> {
  @override
  FutureOr<List<GetproductModel>> build() {
    return getAlldata();
  }

  Future<List<GetproductModel>> getAlldata() async {
    try {
      final serv = await ref.read(getProvider).getProductUser();
      print('Products count: ${serv.length}');
      print('Products: ${serv.map((p) => p.name).toList()}');
      return serv;
    } catch (e) {
      rethrow;
    }
  }
}
