import 'package:ai_chat/constant/app_style.dart';
import 'package:ai_chat/gen/assets.gen.dart';
import 'package:ai_chat/views/home/home_view.dart';
import 'package:ai_chat/widgets/cus_grident_border_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _formAnim;

  List<String> _loginType = [
    Assets.images.google,
    Assets.images.apple,
    Assets.images.facebook
  ];

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _formAnim = Tween<double>(begin: 0.3, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _tapCreate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeView()));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppLayout.paddingMedium),
      child: AnimatedBuilder(
        animation: _formAnim,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, 10 * (1 - _controller.value)),
            child: Opacity(
              opacity: _formAnim.value,
              child: child,
            ),
          );
        },
        child: CusGridentBorderContainer(
          radius: 20,
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.all(AppLayout.paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Create Account", style: AppTextStyle.h1),
              SizedBox(height: AppLayout.paddingLarge),
              CusGridentBorderContainer(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "abhishekgpatelXXXX”gmail.com",
                            hintStyle: AppTextStyle.captionMedium,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: AppLayout.paddingMedium)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.paddingSmall),
                      child: SvgPicture.asset(Assets.images.email, width: 20),
                    )
                  ],
                ),
              ),
              SizedBox(height: AppLayout.paddingMedium),
              CusGridentBorderContainer(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "***********",
                            hintStyle: AppTextStyle.captionMedium,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: AppLayout.paddingMedium)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.paddingSmall),
                      child:
                          SvgPicture.asset(Assets.images.password, width: 20),
                    )
                  ],
                ),
              ),
              SizedBox(height: AppLayout.paddingLarge),
              GestureDetector(
                onTap: _tapCreate,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                          colors: [Color(0xff3659F4), Color(0xff3C82F2)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Center(
                      child: Text(
                    "Create Account",
                    style: AppTextStyle.h3,
                  )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.paddingLarge,
                    vertical: AppLayout.paddingSmall),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.paddingSmall),
                      child: Text(
                        "Or",
                        style: AppTextStyle.h3,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.25),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _loginType.map((e) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppLayout.paddingSmall / 2),
                    child: CusGridentBorderContainer(
                      width: 45,
                      height: 45,
                      radius: 17.25,
                      child: Center(
                        child: SvgPicture.asset(
                          e,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: AppLayout.paddingMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
