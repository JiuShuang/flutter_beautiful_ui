import 'package:flutter/material.dart';
import 'package:music_app/config/app_style.dart';

class StartSection extends StatelessWidget {
  final VoidCallback onTapStarted;
  const StartSection({super.key, required this.onTapStarted});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Open\nthe world of music",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: AppLayout.paddingLarge),
        TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Color(0xffDF3131),
                minimumSize: Size(MediaQuery.sizeOf(context).width, 56)),
            onPressed: onTapStarted,
            child: Text(
              "Get started",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ))
      ],
    );
  }
}
