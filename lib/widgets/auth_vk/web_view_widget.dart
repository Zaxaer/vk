import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_example/domain/configuration/configuration.dart';
import 'package:vk_example/widgets/auth_vk/web_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatelessWidget {
  const WebViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<WebViewWidgetViewModel>();
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: Configuration.authVkJoin,
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
            model.authParsUrl(
              navigation,
              context,
              params['access_token'],
              params['user_id'],
            );
            return NavigationDecision.prevent;
          },
          onWebViewCreated: (webViewController) {
            webViewController.clearCache();
            final cookieManager = CookieManager();
            cookieManager.clearCookies();
          },
        ),
      ),
    );
  }
}
