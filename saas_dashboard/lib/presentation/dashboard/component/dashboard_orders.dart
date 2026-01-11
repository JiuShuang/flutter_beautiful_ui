import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';

class DashboardOrders extends StatelessWidget {
  final double width;
  const DashboardOrders({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.6,
      decoration: BoxDecoration(color: AppColors.primaryColor),
    );
  }
}
