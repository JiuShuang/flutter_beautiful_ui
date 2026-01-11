import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';

class DashboardTopSelling extends StatelessWidget {
  final double width;
  const DashboardTopSelling({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.38,
      decoration: BoxDecoration(color: AppColors.primaryColor),
    );
  }
}
