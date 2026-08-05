import 'package:ai_chat/gen/assets.gen.dart';
import 'package:ai_chat/views/login/sections/login_form.dart';
import 'package:ai_chat/widgets/cus_background.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return CusBackground(
      child: Column(
        children: [Image.asset(Assets.images.loginPic.path), LoginForm()],
      ),
    );
  }
}
