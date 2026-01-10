import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/presentation/home/component/home_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.backgroundColor,
      child: Row(
        children: [
          HomeNavigation()
        ],
      ),
    );
  }
}