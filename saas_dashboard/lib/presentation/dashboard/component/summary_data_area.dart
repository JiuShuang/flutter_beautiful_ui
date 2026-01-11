import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';

class SummaryData {
  final String icon;
  final Color backgroundColor;
  final String number;
  final String type;

  SummaryData({
    required this.icon,
    required this.backgroundColor,
    required this.number,
    required this.type,
  });
}

class SummaryDataArea extends StatefulWidget {
  final double width;
  const SummaryDataArea({super.key, required this.width});

  @override
  State<SummaryDataArea> createState() => _SummaryDataAreaState();
}

class _SummaryDataAreaState extends State<SummaryDataArea> {
  final List<SummaryData> _summaryDataList = [
    SummaryData(
      icon: Assets.images.heart,
      backgroundColor: Color(0xffEFF4FF),
      number: "178+",
      type: "Save Products",
    ),
    SummaryData(
      icon: Assets.images.game,
      backgroundColor: Color(0xffFFF7E1),
      number: "20+",
      type: "Stock Products",
    ),
    SummaryData(
      icon: Assets.images.bag,
      backgroundColor: Color(0xffFFF4F0),
      number: "190+",
      type: "Sales Products",
    ),
    SummaryData(
      icon: Assets.images.work,
      backgroundColor: Color(0xffEFEFFF),
      number: "12+",
      type: "Job Application",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _summaryDataList.map((summary) {
        return Container(
          width: widget.width * 0.23,
          padding: EdgeInsets.symmetric(
            horizontal: AppConstrain.paddingMedium,
            vertical: AppConstrain.paddingMedium,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(AppConstrain.paddingSmall),
                margin: EdgeInsets.only(right: AppConstrain.paddingMedium),
                decoration: BoxDecoration(
                  color: summary.backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(summary.icon, width: 13),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(summary.number, style: TextTheme.of(context).titleSmall),
                  Text(
                    summary.type,
                    style: TextStyle(fontSize: 10, color: Color(0xff030229)),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
