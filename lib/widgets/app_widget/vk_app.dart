import 'package:flutter/material.dart';
import 'package:vk_example/navigation/main_navigation.dart';

// ignore: use_key_in_widget_constructors
class VkApp extends StatelessWidget {
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
      initialRoute: MainNavigation().initialRoute,
      onGenerateRoute: MainNavigation().onGenerateRoute,
    );
  }
}
