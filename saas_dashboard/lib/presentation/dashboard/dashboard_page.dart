import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/presentation/dashboard/component/dashboard_analytics.dart';
import 'package:saas_dashboard/presentation/dashboard/component/dashboard_orders.dart';
import 'package:saas_dashboard/presentation/dashboard/component/dashboard_reports.dart';
import 'package:saas_dashboard/presentation/dashboard/component/dashboard_top_selling.dart';
import 'package:saas_dashboard/presentation/dashboard/component/summary_data_area.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dashboard", style: TextTheme.of(context).titleMedium),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppConstrain.paddingSmall / 2),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "10-06-2021",
                            style: TextTheme.of(context).bodySmall,
                          ),
                          Icon(Icons.keyboard_arrow_down, size: 15),
                        ],
                      ),
                    ),
                    SizedBox(width: AppConstrain.paddingSmall),
                    Container(
                      padding: EdgeInsets.all(AppConstrain.paddingSmall / 2),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "10-10-2021",
                            style: TextTheme.of(context).bodySmall,
                          ),
                          Icon(Icons.keyboard_arrow_down, size: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppConstrain.paddingMedium),
            SummaryDataArea(width: width),
            SizedBox(height: AppConstrain.paddingMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DashboardReports(width: width, height: height),
                DashboardAnalytics(width: width, height: height),
              ],
            ),
            SizedBox(height: AppConstrain.paddingMedium),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardOrders(width: width),
                  DashboardTopSelling(width: width),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
