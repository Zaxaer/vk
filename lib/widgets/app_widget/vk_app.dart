import 'package:flutter/material.dart';
import 'package:vk_example/navigation/main_navigation.dart';

class VkApp extends StatelessWidget {
  const VkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: MainNavigation().route,
      initialRoute: MainNavigationRouteNames.loaderWidget,
      onGenerateRoute: MainNavigation().onGenerateRoute,
    );
  }
}
