import 'package:flutter/material.dart';
import 'package:music_app/config/app_style.dart';

class CusBackground extends StatefulWidget {
  final Widget child;
  const CusBackground({super.key, required this.child});

  @override
  State<CusBackground> createState() => _CusBackgroundState();
}

class _CusBackgroundState extends State<CusBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff1E1E1E), Colors.black],
              begin: Alignment.topCenter,
              stops: [0, 0.8],
              end: Alignment.bottomCenter)),
      child: SafeArea(
          child: Material(
              color: Colors.transparent,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppLayout.paddingMedium),
                child: widget.child,
              ))),
    );
  }
}
