import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const takeToken = 'accesToken';
  static const userId = 'user_id';
}

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getToken() => _secureStorage.read(key: _Keys.takeToken);

  Future<void> setToken(String value) async {
    return _secureStorage.write(key: _Keys.takeToken, value: value);
  }

  Future<void> deleteToken() async {
    return _secureStorage.delete(key: _Keys.takeToken);
  }

  Future<String?> getUserId() => _secureStorage.read(key: _Keys.userId);

  Future<void> setUserId(String? value) async {
    return _secureStorage.write(key: _Keys.userId, value: value);
  }

  Future<void> deleteUserId() async {
    return _secureStorage.delete(key: _Keys.userId);
  }
}
