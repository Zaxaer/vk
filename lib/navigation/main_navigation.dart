import 'package:flutter/material.dart';
import 'package:vk_example/domain/factory/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const authVK = '/auth_vk';
  static const webView = '/web_view';
  static const mainScreenVK = '/main_screen';
  static const friendInfo = '/main_screen/friend';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final route = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderWidget: (context) =>
        _screenFactory.makeLoader(),
    MainNavigationRouteNames.mainScreenVK: (context) =>
        _screenFactory.makeMainScreen(),
    MainNavigationRouteNames.webView: (context) => _screenFactory.makeWebView(),
    MainNavigationRouteNames.authVK: (context) => _screenFactory.makeAuth(),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.friendInfo:
        final arguments = settings.arguments;
        final userId = arguments is int ? arguments : 87473106;
        return MaterialPageRoute(
            builder: (context) => _screenFactory.makeProfileFriends(userId));
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
