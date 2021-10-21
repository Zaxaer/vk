import 'package:flutter/material.dart';
import 'package:vk_example/widgets/auth_vk/auth_widget.dart';

class AuthWidgetVkStateWidget extends StatelessWidget {
  const AuthWidgetVkStateWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            SizedBox(height: 25, width: 25, child: Placeholder()),
            SizedBox(width: 10),
            Text('вконтакте',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ))
          ])),
      body: VkWidget(),
    );
  }
}
