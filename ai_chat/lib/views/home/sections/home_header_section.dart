import 'package:ai_chat/constant/app_style.dart';
import 'package:ai_chat/gen/assets.gen.dart';
import 'package:ai_chat/widgets/cus_grident_border_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeaderSection extends StatefulWidget {
  const HomeHeaderSection({super.key});

  @override
  State<HomeHeaderSection> createState() => _HomeHeaderSectionState();
}

class _HomeHeaderSectionState extends State<HomeHeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            SvgPicture.asset(Assets.images.robot),
            SizedBox(width: AppLayout.paddingSmall),
            Text(
              "Futuristic AI",
              style: AppTextStyle.h1,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: CusGridentBorderContainer(
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.paddingSmall,
                    vertical: AppLayout.paddingSmall * 0.75),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.images.vip),
                    SizedBox(width: AppLayout.paddingSmall / 2),
                    Text(
                      "Pro Model",
                      style: AppTextStyle.bodySmall,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppLayout.paddingSmall),
          child: CusGridentBorderContainer(
            height: 32,
            width: 100,
            child: Center(child: Text("Model 2.2")),
          ),
        ),
      ],
    );
  }
}
