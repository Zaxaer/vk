import 'package:flutter/material.dart';
import 'package:vk_example/Inherited/provider.dart';
import 'package:vk_example/widgets/app_widget/app_model.dart';
import 'package:vk_example/domain/api_client/api_client.dart';
import 'package:vk_example/navigation/main_navigation.dart';
import 'package:vk_example/widgets/theme/style.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:vk_example/domain/data_provider.dart/data_provider.dart';

class VkWidget extends StatelessWidget {
  VkWidget({Key? key}) : super(key: key);
  final colorstyle = ColorStyleAuth();
  final decorator = TextFielsDecorator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            MainScreenAuthWidget(decorator: decorator),
          ],
        ),
      ),
    );
  }
}

class MainScreenAuthWidget extends StatelessWidget {
  final TextFielsDecorator decorator;
  final bottomStyle = BottonStyle();
  final String errorText = '';

  MainScreenAuthWidget({Key? key, required this.decorator}) : super(key: key);

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
          const SizedBox(height: 16),
          EnterButtonWidget(bottomStyle: bottomStyle),
          const SizedBox(height: 5),
          RespPassWidget(bottomStyle: bottomStyle),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Впервые ВКонтакте?',
                style: TextStyle(
                  color: bottomStyle.greyTFColor,
                  fontSize: 17,
                )),
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
          Container(
              margin: const EdgeInsets.all(10),
              height: 20,
              width: 20,
              child: const Placeholder()),
          Text('Войти через Facebook',
              style: TextStyle(color: bottomStyle.blueColor)),
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
        child: Text('Забыли пароль?',
            style: TextStyle(
                color: bottomStyle.blueColor,
                fontWeight: FontWeight.w300,
                fontSize: 17)));
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
        onPressed: () => Navigator.push<_WebViewWidget>(context,
                MaterialPageRoute(builder: (context) {
              return _WebViewWidget();
            })),
        child: const Text('Войти'));
  }
}

class _WebViewWidget extends StatelessWidget {
  final _sessionDataProvider = SessionDataProvider();
  _WebViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authModel = NotifierProvider.read<MyAppModel>(context);
    return Scaffold(
      body: SafeArea(
        child: WebView(
            initialUrl: ApiClient.authVkJoin,
            navigationDelegate: (NavigationRequest navigation) async {
              final uri = Uri.tryParse(navigation.url);
              if (uri == null ||
                  uri.path != '/blank.html' ||
                  uri.fragment.isEmpty) {
                return NavigationDecision.navigate;
              }
              final fragment = uri.fragment;
              var params = <String, String>{};
              for (var string in fragment.split("&")) {
                final array = string.split('=');
                if (array.length != 2) continue;
                final key = array[0];
                final value = array[1];
                if (key.isEmpty || value.isEmpty) continue;
                params[key] = value;
              }
              final accesToken = params['access_token'];
              final userId = params['user_id'];
              _sessionDataProvider.setToken(accesToken);
              _sessionDataProvider.setUserId(userId);
              Navigator.of(context)
                  .pushReplacementNamed(MainNavigationRouteNames.mainScreenVK);
              return NavigationDecision.prevent;
            },
            onWebViewCreated: (webViewController) {
              if (authModel?.isAuth == true) {
                webViewController.clearCache();
                final cookieManager = CookieManager();
                cookieManager.clearCookies();
              }
            }),
      ),
    );
  }
}
