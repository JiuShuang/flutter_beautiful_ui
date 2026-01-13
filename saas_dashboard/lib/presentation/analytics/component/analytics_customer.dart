import 'package:flutter/material.dart';
import 'package:saas_dashboard/presentation/analytics/widget/customer_table.dart';

class AnalyticsCustomer extends StatefulWidget {
  const AnalyticsCustomer({super.key});

  @override
  State<AnalyticsCustomer> createState() => _AnalyticsCustomerState();
}

class _AnalyticsCustomerState extends State<AnalyticsCustomer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(curve: Curves.easeIn, parent: _controller);
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
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 20.0 * (1 - _animation.value)),
          child: Opacity(opacity: _animation.value, child: CustomerTable()),
        );
      },
    );
  }
}
