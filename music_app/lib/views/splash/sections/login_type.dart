import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/config/app_style.dart';
import 'package:music_app/gen/assets.gen.dart';
import 'package:music_app/views/sign_in/sign_in_view.dart';
import 'package:music_app/views/sign_up/sign_up_view.dart';

class LoginType extends StatefulWidget {
  const LoginType({super.key});

  @override
  State<LoginType> createState() => _LoginTypeState();
}

class _LoginTypeState extends State<LoginType>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation _signInAnim;
  late Animation _signUpAnim;
  late Animation _slideAnim;
  late Animation _typeAnim;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _signInAnim = CurvedAnimation(parent: _controller, curve: Interval(0, 0.4));
    _signUpAnim =
        CurvedAnimation(parent: _controller, curve: Interval(0.2, 0.6));
    _slideAnim =
        CurvedAnimation(parent: _controller, curve: Interval(0.4, 0.8));
    _typeAnim = CurvedAnimation(parent: _controller, curve: Interval(0.6, 1));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _tapSignIn() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignInView()));
  }

  void _tapSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpView()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _signInAnim,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, 20.0 * (1 - _signInAnim.value)),
              child: Opacity(opacity: _signInAnim.value, child: child),
            );
          },
          child: TextButton(
              onPressed: _tapSignIn,
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.16),
                  minimumSize: Size(MediaQuery.sizeOf(context).width, 56)),
              child: Text(
                "Sign in",
                style: TextStyle(fontSize: 18, color: AppColors.textColor),
              )),
        ),
        SizedBox(height: AppLayout.paddingMedium),
        AnimatedBuilder(
          animation: _signUpAnim,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, 20.0 * (1 - _signUpAnim.value)),
              child: Opacity(opacity: _signInAnim.value, child: child),
            );
          },
          child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xffDF3131),
                  minimumSize: Size(MediaQuery.sizeOf(context).width, 56)),
              onPressed: _tapSignUp,
              child: Text(
                "Sign up for free",
                style: TextStyle(fontSize: 18, color: AppColors.textColor),
              )),
        ),
        AnimatedBuilder(
          animation: _slideAnim,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, 20.0 * (1 - _slideAnim.value)),
              child: Opacity(opacity: _signInAnim.value, child: child),
            );
          },
          child: Padding(
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
                    "Or continue with",
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
        ),
        AnimatedBuilder(
          animation: _typeAnim,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, 20.0 * (1 - _typeAnim.value)),
              child: Opacity(opacity: _signInAnim.value, child: child),
            );
          },
          child: Row(
            children: [
              Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.16),
                          minimumSize:
                              Size(MediaQuery.sizeOf(context).width, 56)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.images.google),
                          Text(
                            "Google",
                            style: TextStyle(
                                fontSize: 18, color: AppColors.textColor),
                          ),
                        ],
                      ))),
              SizedBox(width: AppLayout.paddingMedium),
              Expanded(
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.16),
                          minimumSize:
                              Size(MediaQuery.sizeOf(context).width, 56)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.images.apple),
                          SizedBox(width: AppLayout.paddingSmall),
                          Text(
                            "Apple",
                            style: TextStyle(
                                fontSize: 18, color: AppColors.textColor),
                          ),
                        ],
                      )))
            ],
          ),
        ),
      ],
    );
  }
}
