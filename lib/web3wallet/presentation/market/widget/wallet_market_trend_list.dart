import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/web3wallet/wallet_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class WalletMarketTrendList extends StatefulWidget {
  final List<String> moneyType;
  const WalletMarketTrendList({super.key, required this.moneyType});

  @override
  State<WalletMarketTrendList> createState() => _WalletMarketTrendListState();
}

class _WalletMarketTrendListState extends State<WalletMarketTrendList>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: widget.moneyType.length,
      itemBuilder: (context, index) {
        final Animation<double> animation = CurvedAnimation(
          parent: controller,
          curve: Interval(
            1 / widget.moneyType.length * index,
            1 / widget.moneyType.length * (index + 1),
          ),
        );
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            final double dy = Tween<double>(
              begin: 20,
              end: 0,
            ).evaluate(animation);
            return Transform.translate(
              offset: Offset(0, dy),
              child: Opacity(opacity: animation.value, child: child),
            );
          },
          child: MoneyTrendItem(moneyType: widget.moneyType[index]),
        );
      },
    );
  }
}

class MoneyTrendItem extends StatelessWidget {
  final String moneyType;

  const MoneyTrendItem({super.key, required this.moneyType});

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: ()=>context.push("/coin/detail"),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: horizontalPadding,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: WalletColor.moneyIconColor[moneyType],
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset(moneyType, width: w * 0.06),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bitcoin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: TextTheme.of(context).bodyLarge?.fontSize,
                    ),
                  ),
                  Text(
                    "2.2%",
                    style: TextStyle(
                      fontSize: TextTheme.of(context).bodySmall?.fontSize,
                      color: Color(0xff9395A4),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: h * 0.03,
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    lineTouchData: LineTouchData(enabled: false),
                    lineBarsData: [
                      LineChartBarData(
                        dotData: const FlDotData(show: false),
                        spots: [
                          FlSpot(0, 2),
                          FlSpot(1, 5),
                          FlSpot(2, 3),
                          FlSpot(3, 8),
                          FlSpot(4, 12),
                          FlSpot(5, 7),
                          FlSpot(6, 15),
                          FlSpot(7, 10),
                          FlSpot(8, 4),
                          FlSpot(9, 9),
                          FlSpot(10, 13),
                          FlSpot(11, 6),
                          FlSpot(12, 14),
                          FlSpot(13, 8),
                          FlSpot(14, 11),
                        ],
                        isCurved: true,
                        color: Color(0xffFF6464),
                        barWidth: 3,
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$28,312,22",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: TextTheme.of(context).bodyLarge?.fontSize,
                  ),
                ),
                Text(
                  "MCap \$893.43 Bn",
                  style: TextStyle(
                    fontSize: TextTheme.of(context).bodySmall?.fontSize,
                    color: Color(0xff9395A4),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
