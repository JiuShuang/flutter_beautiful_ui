import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/presentation/analytics/analytics_page.dart';
import 'package:saas_dashboard/presentation/calendar/calendar_page.dart';
import 'package:saas_dashboard/presentation/dashboard/dashboard_page.dart';
import 'package:saas_dashboard/presentation/home/component/home_navigation.dart';
import 'package:saas_dashboard/presentation/invoice/invoice_page.dart';
import 'package:saas_dashboard/presentation/message/message_page.dart';
import 'package:saas_dashboard/presentation/schedule/schedule_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeIndex = 0;
  final List<Widget> _pages = [
    DashboardPage(),
    AnalyticsPage(),
    InvoicePage(),
    SchedulePage(),
    CalendarPage(),
    MessagePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.backgroundColor,
      child: Row(
        children: [
          HomeNavigation(
            onChanged: (value) {
              setState(() {
                _activeIndex = value;
              });
            },
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.all(AppConstrain.paddingLarge),
              child: _pages[_activeIndex],
            ),
          ),
        ],
      ),
    );
  }
}
