import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_theme.dart';
import 'package:saas_dashboard/presentation/auth/auth_page.dart';
import 'package:saas_dashboard/presentation/home/home_page.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = WindowOptions(
    size: Size(1060, 700),
    minimumSize: Size(1060, 700),
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: Material(child: HomePage()),
    );
  }
}
