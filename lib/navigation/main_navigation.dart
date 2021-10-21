import 'package:flutter/material.dart';
import 'package:vk_example/Inherited/provider.dart';
import 'package:vk_example/widgets/auth_vk/auth_appbar_vk.dart';
import 'package:vk_example/widgets/main_screen_vk/friend_info/friend_info_model.dart';
import 'package:vk_example/widgets/main_screen_vk/friend_info/friend_widget.dart';
import 'package:vk_example/widgets/main_screen_vk/main_screen_widget.dart';

abstract class MainNavigationRouteNames {
  static const authVK = '/authVk';
  static const mainScreenVK = '/main_screen';
  static const friendInfo = '/main_screen/friend';
}

class MainNavigation {
  String? initialRoute = MainNavigationRouteNames.authVK;
  final route = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.authVK: (context) =>
        const AuthWidgetVkStateWidget(),
    MainNavigationRouteNames.mainScreenVK: (context) =>
        const MainScreenWidget(),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.friendInfo:
        final arguments = settings.arguments;
        final userId = arguments is int ? arguments : 87473106;
        return MaterialPageRoute(
          builder: (context) => NotifierProvider(
            model: ProfileFriendsModel(userId: userId),
            child: const FriendInfoWidget(),
          ),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
