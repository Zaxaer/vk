import 'package:flutter/material.dart';
import 'package:vk_example/domain/api_client/api_client.dart';
import 'package:vk_example/domain/data_provider.dart/data_provider.dart';
import 'package:vk_example/navigation/main_navigation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidgetExit extends StatelessWidget {
  final _sessionDataProvider = SessionDataProvider();
  WebViewWidgetExit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              webViewController.clearCache();
              final cookieManager = CookieManager();
              cookieManager.clearCookies();
            }),
      ),
    );
  }
}
