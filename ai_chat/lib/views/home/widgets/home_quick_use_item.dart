import 'package:ai_chat/constant/app_style.dart';
import 'package:ai_chat/gen/assets.gen.dart';
import 'package:ai_chat/widgets/cus_grident_border_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeQuickUseItem extends StatefulWidget {
  final VoidCallback onTap;
  final Widget title;
  final String hintText;
  const HomeQuickUseItem(
      {super.key,
      required this.onTap,
      required this.title,
      required this.hintText});

  @override
  State<HomeQuickUseItem> createState() => _HomeQuickUseItemState();
}

class _HomeQuickUseItemState extends State<HomeQuickUseItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: CusGridentBorderContainer(
        padding: EdgeInsets.all(AppLayout.paddingMedium),
        radius: 20,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.title,
                Text(
                  widget.hintText,
                  style: AppTextStyle.captionSmall,
                )
              ],
            )),
            SizedBox(width: AppLayout.paddingSmall),
            CusGridentBorderContainer(
              width: 36,
              height: 36,
              child: Center(child: SvgPicture.asset(Assets.images.up)),
            )
          ],
        ),
      ),
    );
  }
}
