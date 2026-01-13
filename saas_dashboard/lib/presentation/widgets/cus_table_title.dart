import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';

class CusTableTitle extends StatelessWidget {
  final String text;
  final bool showArrow;
  final VoidCallback? tapArrow;
  const CusTableTitle({
    super.key,
    required this.text,
    this.showArrow = true,
    this.tapArrow,
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppConstrain.paddingSmall / 2),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(
                right: AppConstrain.paddingSmall,
              ),
              child: Text(
                text,
                style: TextStyle(color: Color(0xff030229), fontSize: 11),
              ),
            ),
            if (showArrow)
              GestureDetector(
                child: SvgPicture.asset(
                  Assets.images.arrow,
                  colorFilter: ColorFilter.mode(
                    Color(0xffCDCCD4),
                    BlendMode.srcIn,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
