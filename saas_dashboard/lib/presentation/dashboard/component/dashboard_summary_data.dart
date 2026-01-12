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

class DashboardSummaryData extends StatefulWidget {
  final double width;
  const DashboardSummaryData({super.key, required this.width});

  @override
  State<DashboardSummaryData> createState() => _DashboardSummaryDataState();
}

class _DashboardSummaryDataState extends State<DashboardSummaryData>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

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
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List<Widget>.generate(_summaryDataList.length, (index) {
        final SummaryData summary = _summaryDataList[index];
        final Animation animation = CurvedAnimation(
          parent: _controller,
          curve: Interval(
            1 / _summaryDataList.length * index,
            1 / _summaryDataList.length * (index + 1),
          ),
        );
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(20.0*(1-animation.value), 0),
              child: Opacity(opacity: animation.value, child: child));
          },
          child: Container(
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
                    Text(
                      summary.number,
                      style: TextTheme.of(context).titleSmall,
                    ),
                    Text(
                      summary.type,
                      style: TextStyle(fontSize: 10, color: Color(0xff030229)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
