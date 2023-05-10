import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage storage = FlutterSecureStorage();
  static const key = 'accessToken';
  static const lang = 'lang';

  static Future setToken(value) async {
    await storage.write(key: key, value: value);
  }

  static Future getToken(value) async {
    var res = await storage.read(key: key);

    return res;
  }

  static Future setLang(value) async {
    await storage.write(key: lang, value: value);
  }

  static Future getLang() async {
    var res = await storage.read(key: lang);

    return res;
  }
}
