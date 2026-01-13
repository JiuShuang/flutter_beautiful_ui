import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';
import 'package:saas_dashboard/presentation/analytics/widget/product_add_bar_chart.dart';
import 'package:saas_dashboard/presentation/analytics/widget/product_sales_pie_chart.dart';
import 'package:saas_dashboard/presentation/analytics/widget/product_selling_table.dart';
import 'package:saas_dashboard/presentation/analytics/widget/product_total_line_chart.dart';

class AnalyticsProduct extends StatefulWidget {
  final double width;
  final double height;
  const AnalyticsProduct({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<AnalyticsProduct> createState() => _AnalyticsProductState();
}

class _AnalyticsProductState extends State<AnalyticsProduct>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _leftAreaAnimation;
  late final Animation _rightAreaAnimation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _leftAreaAnimation = CurvedAnimation(
      curve: Curves.easeIn,
      parent: _controller,
    );
    _rightAreaAnimation = CurvedAnimation(
      curve: Curves.easeIn,
      parent: _controller,
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedBuilder(
          animation: _leftAreaAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(-20.0 * (1 - _leftAreaAnimation.value), 0),
              child: Opacity(opacity: _leftAreaAnimation.value, child: child),
            );
          },
          child: SizedBox(
            width: widget.width * 0.65,
            child: Column(
              children: [
                ProductTotalLineChart(
                  width: widget.width,
                  height: widget.height,
                ),
                SizedBox(height: AppConstrain.paddingMedium),
                Expanded(child: ProductSellingTable(width: widget.width)),
              ],
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _rightAreaAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(20.0 * (1 - _rightAreaAnimation.value), 0),
              child: Opacity(opacity: _rightAreaAnimation.value, child: child),
            );
          },
          child: SizedBox(
            width: widget.width * 0.33,
            child: Column(
              children: [
                ProductAddBarChart(
                  width: widget.width,
                  height: widget.height,
                ),
                SizedBox(height: AppConstrain.paddingMedium),
                Expanded(
                  child: ProductSalesPieChart(
                    width: widget.width,
                    height: widget.height,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
