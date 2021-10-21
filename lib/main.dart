import 'package:flutter/material.dart';
import 'package:vk_example/Inherited/provider.dart';
import 'package:vk_example/widgets/app_widget/app_model.dart';
import 'package:vk_example/widgets/app_widget/vk_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.checkAuth();
  final app = NotifierProvider(model: model, child: VkApp());
  runApp(app);
}
