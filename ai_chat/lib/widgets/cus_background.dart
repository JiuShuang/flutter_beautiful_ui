import 'package:ai_chat/constant/app_style.dart';
import 'package:flutter/material.dart';

class CusBackground extends StatelessWidget {
  final Widget child;
  const CusBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColorFirst,
      body: Stack(
        children: [
          Positioned(
              left: -(MediaQuery.sizeOf(context).width * 0.5 / 2),
              top: 0,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: MediaQuery.sizeOf(context).width * 0.5,
                decoration: BoxDecoration(
                    color: AppColor.bgColorSecond,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.bgColorSecond,
                          spreadRadius: 100,
                          blurRadius: 80)
                    ]),
              )),
          Positioned(
              left: -(MediaQuery.sizeOf(context).width * 0.1),
              bottom: 0,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.25,
                height: MediaQuery.sizeOf(context).width * 0.6,
                decoration: BoxDecoration(
                    color: AppColor.bgColorSecond,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.bgColorSecond,
                          spreadRadius: 100,
                          blurRadius: 80)
                    ]),
              )),
          Positioned(
              right: -(MediaQuery.sizeOf(context).width * 0.2),
              bottom: MediaQuery.sizeOf(context).height*0.4,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.25,
                height: MediaQuery.sizeOf(context).width * 0.6,
                decoration: BoxDecoration(
                    color: AppColor.bgColorSecond,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.bgColorSecond,
                          spreadRadius: 100,
                          blurRadius: 100)
                    ]),
              )),
          Positioned.fill(child: child)
        ],
      ),
    );
  }
}
