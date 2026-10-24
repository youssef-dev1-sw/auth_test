import 'package:shared_preferences/shared_preferences.dart';

class StorageToken {
  Future<void> saveToken(String accesToken) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("accec_token", accesToken);
  }

  Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("accec_token");
  }

  Future<Map<String, String>> authHeader() async {
    final token = await getToken();

    if (token == null) {
      return {};
    } else {
      return {'Authorization': 'Bearer $token'};
    }
  }
}
