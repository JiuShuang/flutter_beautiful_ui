import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/web3wallet/widget/blur_color_widget.dart';
import 'package:go_router/go_router.dart';

class WalletCoinDetailPage extends StatefulWidget {
  const WalletCoinDetailPage({super.key});

  @override
  State<WalletCoinDetailPage> createState() => _WalletCoinDetailPageState();
}

class _WalletCoinDetailPageState extends State<WalletCoinDetailPage> {
  int _activeTimeIndex = 0;
  final List<String> _timeRange = ["24H", "1W", "1Y", "ALL", "Point"];

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xfff3f5f6),
        child: Stack(
          children: [
            Positioned(
              right: -30,
              top: -100,
              child: BlurColorWidget(size: 209, color: Color(0xffFFE3C9)),
            ),
            Positioned(
              left: -100,
              top: h * 0.6,
              child: BlurColorWidget(size: 187, color: Color(0xffFFC2C6)),
            ),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    style: IconButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: ()=>context.pop(),
                    icon: Icon(Icons.keyboard_arrow_left_outlined),
                  ),
                  actions: [
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz_outlined),
                    ),
                  ],
                  title: Text(
                    "Etherium(ETH)",
                    style: TextStyle(
                      fontSize: TextTheme.of(context).titleMedium?.fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "\$32,128.80",
                          style: TextStyle(
                            fontSize: TextTheme.of(
                              context,
                            ).titleLarge?.fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.end,
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Color(0xff5FC88F),
                                ),
                              ),
                              TextSpan(
                                text: '2.5%',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff9395A4),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: w,
                          height: h * 0.065,
                          decoration: BoxDecoration(
                            color: Color(0xffEBEFF1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                AnimatedPositioned(
                                  duration: Duration(milliseconds: 500),
                                  top: 5,
                                  bottom: 5,
                                  left:
                                      5 +
                                      _activeTimeIndex *
                                          (w - 2 * horizontalPadding - 10) /
                                          _timeRange.length,
                                  child: Container(
                                    width:
                                        (w - 2 * horizontalPadding - 10) /
                                        _timeRange.length,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(70),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: List.generate(_timeRange.length, (
                                    index,
                                  ) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          _activeTimeIndex = index;
                                        });
                                      },
                                      child: SizedBox(
                                        width:
                                            (w - 2 * horizontalPadding - 10) /
                                            _timeRange.length,
                                        child: Center(
                                          child: AnimatedDefaultTextStyle(
                                            duration: Duration(
                                              milliseconds: 500,
                                            ),
                                            style: TextStyle(
                                              color: _activeTimeIndex == index
                                                  ? Colors.black
                                                  : Color(0xff9395A5),
                                              fontWeight: FontWeight.bold,
                                            ),
                                            child: Text(_timeRange[index]),
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
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.symmetric(vertical: h * 0.05),
                          height: h * 0.3,
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
                              gridData: FlGridData(
                                show: true,
                                drawVerticalLine: false,
                              ),
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
                                    FlSpot(7, 10),
                                    FlSpot(8, 4),
                                    FlSpot(9, 9),
                                    FlSpot(10, 13),
                                    FlSpot(11, 6),
                                    FlSpot(12, 14),
                                  ],
                                  isCurved: true,
                                  color: Color(0xffF04086),
                                  barWidth: 6,
                                  belowBarData: BarAreaData(show: false),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                foregroundColor: Color(0xff767DFF),
                                minimumSize: Size(w * 0.4, h * 0.06),
                              ),
                              onPressed: () {},
                              child: Text("Set Alert"),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                foregroundColor: Colors.white,
                                minimumSize: Size(w * 0.4, h * 0.06),
                              ),
                              onPressed: () {},
                              child: Text("Buy Now"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    margin: EdgeInsets.only(top: h * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(140),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.all(horizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Market Statistic",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: TextTheme.of(
                              context,
                            ).titleLarge?.fontSize,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: h * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Market capitalization",
                                style: TextStyle(
                                  color: Color(0xff9395A4),
                                  fontSize: TextTheme.of(
                                    context,
                                  ).bodyLarge?.fontSize,
                                ),
                              ),
                              Text(
                                "\$231,233",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: TextTheme.of(
                                    context,
                                  ).bodyLarge?.fontSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: h * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Circulating Suply",
                                style: TextStyle(
                                  color: Color(0xff9395A4),
                                  fontSize: TextTheme.of(
                                    context,
                                  ).bodyLarge?.fontSize,
                                ),
                              ),
                              Text(
                                "114.211 ETH",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: TextTheme.of(
                                    context,
                                  ).bodyLarge?.fontSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
