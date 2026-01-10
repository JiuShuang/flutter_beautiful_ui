import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';

class HomeNavigationItem {
  final String icon;
  final String title;
  final Widget? child;
  HomeNavigationItem({required this.icon, required this.title, this.child});
}

class HomeNavigationBar extends StatefulWidget {
  final List<HomeNavigationItem> navigationList;
  final int activeIndex;
  final bool showLabel;
  final ValueChanged<int> onChanged;
  final Color? inActiveColor;
  final Color? activeColor;
  final BoxConstraints constraints;
  const HomeNavigationBar({
    super.key,
    required this.navigationList,
    required this.activeIndex,
    required this.onChanged,
    this.inActiveColor,
    this.activeColor,
    this.showLabel = true,
    required this.constraints,
  });

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  late int _activeIndex;
  late Color _activeColor;
  late Color _inactiveColor;

  @override
  void initState() {
    _activeIndex = widget.activeIndex;
    _activeColor = widget.activeColor ?? AppColors.secondColor;
    _inactiveColor = widget.inActiveColor ?? Color(0xff9A9AA9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(widget.navigationList.length, (index) {
        HomeNavigationItem item = widget.navigationList[index];
        bool isActive = _activeIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              _activeIndex = index;
            });
            widget.onChanged(index);
          },
          child: Container(
            constraints: BoxConstraints(maxWidth: widget.constraints.maxWidth),
            margin: EdgeInsets.symmetric(
              vertical: AppConstrain.paddingSmall / 8,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppConstrain.paddingLarge,
              vertical: AppConstrain.paddingSmall / 2,
            ),
            decoration: BoxDecoration(
              gradient: isActive
                  ? LinearGradient(
                      stops: widget.showLabel ? [0.01, 0.15] : [0.01, 0.5],
                      colors: [
                        const Color.fromARGB(255, 211, 210, 249).withAlpha(120),
                        const Color.fromARGB(255, 209, 208, 244).withAlpha(0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                  : null,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  width: 17,
                  item.icon,
                  colorFilter: ColorFilter.mode(
                    isActive ? _activeColor : _inactiveColor,
                    BlendMode.srcIn,
                  ),
                ),
                Expanded(
                  child: widget.showLabel
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppConstrain.paddingSmall,
                          ),
                          child: AnimatedDefaultTextStyle(
                            style: TextStyle(
                              fontSize: TextTheme.of(
                                context,
                              ).bodySmall?.fontSize,
                              color: isActive ? _activeColor : _inactiveColor,
                            ),
                            duration: Duration(milliseconds: 250),
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              item.title,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ),
                item.child ?? SizedBox.shrink(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
