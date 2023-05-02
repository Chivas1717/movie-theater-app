import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage storage = FlutterSecureStorage();
  static const key = 'accessToken';

  static Future setToken(value) async {
    await storage.write(key: key, value: value);
  }

  static Future getToken(value) async {
    var res = await storage.read(key: key);

    return res;
  }
}
