import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/gen/assets.gen.dart';
import 'package:saas_dashboard/presentation/home/widget/home_navigation_bar.dart';

class HomeNavigation extends StatefulWidget {
  final ValueChanged<int> onChanged;
  const HomeNavigation({super.key, required this.onChanged});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  final List<HomeNavigationItem> _navigationList = [
    HomeNavigationItem(icon: Assets.images.dashboard, title: "Dashboard"),
    HomeNavigationItem(icon: Assets.images.analytics, title: "Analytics"),
    HomeNavigationItem(icon: Assets.images.invoice, title: "Invoice"),
    HomeNavigationItem(icon: Assets.images.schedule, title: "Schedule"),
    HomeNavigationItem(icon: Assets.images.calendar, title: "Calendar"),
    HomeNavigationItem(icon: Assets.images.messages, title: "Messages"),
  ];

  bool _showLabel = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          _showLabel = !_showLabel;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: _showLabel ? 160 : 60,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: _showLabel
              ? null
              : BorderRadius.circular(AppConstrain.borderRadius),
        ),
        margin: _showLabel
            ? EdgeInsets.zero
            : EdgeInsets.symmetric(
                horizontal: AppConstrain.paddingMedium,
                vertical: AppConstrain.paddingLarge * 1.5,
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: AppConstrain.paddingLarge * 1.5,
                bottom: AppConstrain.paddingLarge,
              ),
              child: LogoArea(),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return HomeNavigationBar(
                    constraints: constraints,
                    navigationList: _navigationList,
                    activeIndex: 0,
                    showLabel: _showLabel,
                    onChanged: (value)=>widget.onChanged(value),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppConstrain.paddingSmall),
              child: UserArea(),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoArea extends StatelessWidget {
  const LogoArea({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 130) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 80),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(Assets.images.logo, width: 30),
                SizedBox(width: AppConstrain.paddingSmall),
                Expanded(child: Text("Base", maxLines: 1)),
              ],
            ),
          );
        }
        return Column(
          children: [
            SvgPicture.asset(Assets.images.logo, width: 30),
            SizedBox(width: AppConstrain.paddingSmall),
            Text("Base"),
          ],
        );
      },
    );
  }
}

class UserArea extends StatelessWidget {
  const UserArea({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 80) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
                child: Image.asset(Assets.images.avatar.path, width: 32),
              ),
              SizedBox(height: AppConstrain.paddingSmall),
              SvgPicture.asset(Assets.images.logout, width: 15),
            ],
          );
        }
        return Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
                child: Image.asset(Assets.images.avatar.path, width: 32),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Easin Arafat",
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  Text("Free Account", style: TextStyle(fontSize: 8)),
                ],
              ),
            ),
            SvgPicture.asset(Assets.images.logout, width: 15),
          ],
        );
      },
    );
  }
}
