import 'package:flutter/cupertino.dart';
import 'package:vk_example/domain/data_provider.dart/data_provider.dart';

class MyAppModel extends ChangeNotifier {
  final _sessionDataProvider = SessionDataProvider();
  var _isAuth = true;
  bool get isAuth => _isAuth;

  Future<void> checkAuth() async {
    final sessionId = await _sessionDataProvider.getToken();
    _isAuth = sessionId == null;
  }
}
