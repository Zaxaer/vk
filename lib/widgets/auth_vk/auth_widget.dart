import 'package:flutter/material.dart';
import 'package:vk_example/navigation/main_navigation.dart';
import 'package:vk_example/widgets/theme/style.dart';

class AuthWidgetWidget extends StatelessWidget {
  const AuthWidgetWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('вконтакте',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ))
          ],
        ),
      ),
      body: VkWidget(),
    );
  }
}

class VkWidget extends StatelessWidget {
  final colorstyle = ColorStyleAuth();
  final decorator = TextFielsDecorator();
  VkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            MainScreenAuthWidget(),
          ],
        ),
      ),
    );
  }
}

class MainScreenAuthWidget extends StatelessWidget {
  final bottomStyle = BottonStyle();

  MainScreenAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            'Мобильная версия поможет вам оставаться ВКонтакте, даже если вы далеко от компьютера.',
            style: TextStyle(color: Color(0xff5D5F61), fontSize: 17),
          ),
          const SizedBox(height: 16),
          EnterButtonWidget(bottomStyle: bottomStyle),
          const SizedBox(height: 5),
          RespPassWidget(bottomStyle: bottomStyle),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Впервые ВКонтакте?',
              style: TextStyle(
                color: bottomStyle.greyTFColor,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(height: 8),
          RegistrationWidget(bottomStyle: bottomStyle),
          const SizedBox(height: 12),
          EnterFacebookWidget(bottomStyle: bottomStyle),
        ],
      ),
    );
  }
}

class EnterFacebookWidget extends StatelessWidget {
  const EnterFacebookWidget({Key? key, required this.bottomStyle})
      : super(key: key);

  final BottonStyle bottomStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: bottomStyle.bottomStyle(
        bottomStyle.whiteColor,
        bottomStyle.pressButtonColor,
        bottomStyle.borderButtonColor,
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Войти через Facebook',
            style: TextStyle(color: bottomStyle.blueColor),
          ),
        ],
      ),
    );
  }
}

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({Key? key, required this.bottomStyle})
      : super(key: key);

  final BottonStyle bottomStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: bottomStyle.bottomStyle(bottomStyle.greenColor,
          bottomStyle.pressButtonColor, bottomStyle.greenColor),
      onPressed: () {},
      child: const Text('Зарегистрироваться'),
    );
  }
}

class RespPassWidget extends StatelessWidget {
  const RespPassWidget({Key? key, required this.bottomStyle}) : super(key: key);

  final BottonStyle bottomStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Забыли пароль?',
        style: TextStyle(
            color: bottomStyle.blueColor,
            fontWeight: FontWeight.w300,
            fontSize: 17),
      ),
    );
  }
}

class EnterButtonWidget extends StatelessWidget {
  const EnterButtonWidget({Key? key, required this.bottomStyle})
      : super(key: key);

  final BottonStyle bottomStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: bottomStyle.bottomStyle(bottomStyle.blueColor,
          bottomStyle.pressButtonColor, bottomStyle.blueColor),
      onPressed: () => Navigator.pushNamedAndRemoveUntil(
          context, MainNavigationRouteNames.webView, (route) => false),
      child: const Text('Войти'),
    );
  }
}
