import 'package:ai_chat/constant/app_style.dart';
import 'package:ai_chat/gen/assets.gen.dart';
import 'package:ai_chat/views/home/home_view.dart';
import 'package:ai_chat/widgets/cus_background.dart';
import 'package:ai_chat/widgets/cus_grident_border_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  List<String> _loginType = [
    Assets.images.google,
    Assets.images.apple,
    Assets.images.facebook
  ];

  void _tapCreate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeView()));
  }

  @override
  Widget build(BuildContext context) {
    return CusBackground(
      child: Column(
        children: [
          Image.asset(Assets.images.loginPic.path),
          Padding(
            padding: EdgeInsets.all(AppLayout.paddingMedium),
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
                          child:
                              SvgPicture.asset(Assets.images.email, width: 20),
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
                          child: SvgPicture.asset(Assets.images.password,
                              width: 20),
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
          )
        ],
      ),
    );
  }
}
