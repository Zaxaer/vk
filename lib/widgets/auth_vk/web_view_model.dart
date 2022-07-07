import 'package:flutter/material.dart';
import 'package:vk_example/domain/services/auth_services.dart';
import 'package:vk_example/navigation/main_navigation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidgetViewModel {
  final _authServices = AuthServices();

  Future<void> authParsUrl(
    NavigationRequest navigation,
    BuildContext context,
    String? accesToken,
    String? userId,
  ) async {
    final token = accesToken ?? '';
    final id = userId ?? '';
    if (token == '' || id == '') {
      Navigator.of(context)
          .pushReplacementNamed(MainNavigationRouteNames.loaderWidget);
    } else {
      _authServices.enterAccount(setToken: token, setUserId: id);
      Navigator.of(context)
          .pushReplacementNamed(MainNavigationRouteNames.mainScreenVK);
    }
  }
}
