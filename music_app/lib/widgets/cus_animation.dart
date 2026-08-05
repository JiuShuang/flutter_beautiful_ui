import 'package:flutter/material.dart';



class CusAnimation extends StatefulWidget {
  final Animation animation;
  final Widget child;
  const CusAnimation({super.key, required this.animation, required this.child});

  @override
  State<CusAnimation> createState() => _CusAnimationState();
}

class _CusAnimationState extends State<CusAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, build) {
        return Transform.scale();
      },
      child: widget.child,
    );
  }
}

