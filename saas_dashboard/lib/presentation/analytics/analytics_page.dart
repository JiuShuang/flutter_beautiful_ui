import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/presentation/analytics/component/analytics_customer.dart';
import 'package:saas_dashboard/presentation/analytics/component/analytics_product.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  int _activeLabelIndex = 0;
  final List<String> _label = ["Product", "Customer"];

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
                Text(
                  "${_label[_activeLabelIndex]} Analytics",
                  style: TextTheme.of(context).titleMedium,
                ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * 0.18,
                  height: height * 0.04,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(
                      AppConstrain.borderRadius / 1.5,
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 250),
                          top: 0,
                          bottom: 0,
                          left: _activeLabelIndex == 1 ? width * 0.18 / 2 : 0,
                          child: Container(
                            width: width * 0.18 / 2,
                            decoration: BoxDecoration(
                              color: AppColors.secondColor,
                              borderRadius: BorderRadius.circular(
                                AppConstrain.borderRadius / 1.5,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(_label.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _activeLabelIndex = index;
                                });
                              },
                              child: SizedBox(
                                width: width * 0.18 / 2,
                                child: Center(
                                  child: Text(
                                    _label[index],
                                    style: TextStyle(
                                      color: _activeLabelIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: TextTheme.of(
                                        context,
                                      ).bodySmall?.fontSize,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(width * 0.1, height * 0.05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppConstrain.borderRadius / 2,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.add, color: AppColors.primaryColor, size: 13),
                      Text(
                        "Add ${_label[_activeLabelIndex]}",
                        style: TextStyle(
                          fontSize: TextTheme.of(context).bodySmall?.fontSize,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConstrain.paddingMedium),
            Expanded(
              child: _activeLabelIndex == 0
                  ? AnalyticsProduct(width: width, height: height)
                  : AnalyticsCustomer(),
            ),
          ],
        );
      },
    );
  }
}
