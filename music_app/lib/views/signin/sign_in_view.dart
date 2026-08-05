import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/config/app_style.dart';
import 'package:music_app/gen/assets.gen.dart';
import 'package:music_app/widgets/cus_background.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  ValueNotifier<bool> _hasAccount = ValueNotifier(false);
  ValueNotifier<bool> _hasPassword = ValueNotifier(false);

  void _tapSignIn() {}

  @override
  Widget build(BuildContext context) {
    return CusBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(Assets.images.back)),
        title: Text(
          "Sign in",
          style: AppTextStyle.h3,
        ),
      ),
      body: Column(
        children: [
          ListenableBuilder(
            listenable: _hasAccount,
            builder: (context, child) {
              return Container(
                padding:
                    EdgeInsets.symmetric(horizontal: AppLayout.paddingMedium),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: _hasAccount.value
                            ? AppColors.textColor
                            : AppColors.borderColor,
                        width: 1.5),
                    borderRadius:
                        BorderRadius.circular(AppLayout.borderRadius)),
                child: child,
              );
            },
            child: TextField(
                style: AppTextStyle.bodyModium,
                cursorColor: AppColors.textColor,
                onChanged: (value) {
                  _hasAccount.value = value.isEmpty ? false : true;
                },
                decoration: InputDecoration(
                    hintText: "Username or Email address",
                    labelText: "Username or Email address",
                    labelStyle: AppTextStyle.labelLarge,
                    hintStyle: AppTextStyle.labelLarge,
                    border: InputBorder.none)),
          ),
          ListenableBuilder(
            listenable: _hasPassword,
            builder: (context, child) {
              return Container(
                padding:
                    EdgeInsets.symmetric(horizontal: AppLayout.paddingMedium),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: _hasPassword.value
                            ? AppColors.textColor
                            : AppColors.borderColor,
                        width: 1.5),
                    borderRadius:
                        BorderRadius.circular(AppLayout.borderRadius)),
                margin: EdgeInsets.symmetric(vertical: AppLayout.paddingMedium),
                child: child,
              );
            },
            child: TextField(
              style: AppTextStyle.bodyModium,
              cursorColor: AppColors.textColor,
              onChanged: (value) {
                _hasPassword.value = value.isEmpty ? false : true;
              },
              decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  labelStyle: AppTextStyle.labelLarge,
                  hintStyle: AppTextStyle.labelLarge,
                  border: InputBorder.none),
            ),
          ),
          ListenableBuilder(
            listenable: Listenable.merge([_hasAccount, _hasPassword]),
            builder: (context, child) {
              final bool enable = _hasAccount.value && _hasPassword.value;
              return TextButton(
                  onPressed: _tapSignIn,
                  style: TextButton.styleFrom(
                      backgroundColor:
                          enable ? AppColors.red : AppColors.btnColor,
                      minimumSize: Size(MediaQuery.sizeOf(context).width, 56)),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: enable
                            ? AppColors.textColor
                            : AppColors.labelTextColor),
                  ));
            },
          ),
          SizedBox(height: AppLayout.paddingLarge),
          GestureDetector(
            child: Text(
              "Forget password?",
              style: AppTextStyle.bodyModium,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppLayout.paddingLarge),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  height: 1,
                  color: Colors.white.withOpacity(0.2),
                )),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppLayout.paddingMedium),
                  child: Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white.withOpacity(0.5)),
                  ),
                ),
                Expanded(
                    child: Container(
                  height: 1,
                  color: Colors.white.withOpacity(0.2),
                )),
              ],
            ),
          ),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: AppColors.btnColor,
                  minimumSize: Size(MediaQuery.sizeOf(context).width, 56)),
              child: Text(
                "Sign up for free",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.textColor),
              )),
        ],
      ),
    ));
  }
}
