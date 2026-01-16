import 'package:flutter/material.dart';

class CusTimeline extends StatelessWidget {
  const CusTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: List.generate(24, (index) {
            String hourString = index.toString().padLeft(2, '0');
            String period = index < 12 ? "am" : "pm";
            return SizedBox(
              height: 50,
              child: Align(
                alignment: AlignmentGeometry.topCenter,
                child: Text(
                  "$hourString:00 $period",
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xff68677F),
                  ),
                ),
              ),
            );
          }),
        ),
        Expanded(
          child: Column(
            children: List.generate(23, (index) {
              return Container(
                height: 50,
                padding: EdgeInsets.only(top: 10),
                child: Center(
                  child: Divider(height: 0, color: Color(0xffF2F2F4)),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
