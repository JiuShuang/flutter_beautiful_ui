import 'package:flutter/material.dart';

import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/presentation/dashboard/component/dashboard_analytics.dart';
import 'package:saas_dashboard/presentation/dashboard/component/dashboard_orders.dart';
import 'package:saas_dashboard/presentation/dashboard/component/dashboard_reports.dart';
import 'package:saas_dashboard/presentation/dashboard/component/dashboard_top_selling.dart';
import 'package:saas_dashboard/presentation/dashboard/component/dashboard_summary_data.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation _reportAndAnalyticsAnimation;
  late Animation _orderAndSellingAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _reportAndAnalyticsAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(0, 0.5),
    );
    _orderAndSellingAnimation = CurvedAnimation(
      curve: Interval(0.5, 1),
      parent: _controller,
    );
    _controller.forward();
    super.initState();
  }

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
            DashboardSummaryData(width: width),
            SizedBox(height: AppConstrain.paddingMedium),
            AnimatedBuilder(
              animation: _reportAndAnalyticsAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    0,
                    20.0 * (1 - _reportAndAnalyticsAnimation.value),
                  ),
                  child: Opacity(
                    opacity: _reportAndAnalyticsAnimation.value,
                    child: child,
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardReports(width: width, height: height),
                  DashboardAnalytics(width: width, height: height),
                ],
              ),
            ),
            SizedBox(height: AppConstrain.paddingMedium),
            Expanded(
              child: AnimatedBuilder(
                animation: _orderAndSellingAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      20.0 * (1 - _orderAndSellingAnimation.value),
                    ),
                    child: Opacity(
                      opacity: _orderAndSellingAnimation.value,
                      child: child,
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashboardOrders(width: width),
                    DashboardTopSelling(width: width, height: height),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
