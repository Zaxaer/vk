import 'package:vk_example/domain/data_provider.dart/data_provider.dart';

class AuthServices {
  final _sessionDataProvider = SessionDataProvider();

  Future<void> enterAccount(
      {required String setToken, required String setUserId}) async {
    _sessionDataProvider.setToken(setToken);
    _sessionDataProvider.setUserId(setUserId);
  }

  Future<void> exitAccount() async {
    _sessionDataProvider.deleteToken();
    _sessionDataProvider.deleteUserId();
  }

  Future<String?> getToken() => _sessionDataProvider.getToken();
}
