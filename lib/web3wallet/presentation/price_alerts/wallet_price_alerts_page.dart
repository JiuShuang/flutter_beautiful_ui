import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/gen/assets.gen.dart';
import 'package:flutter_beautiful_ui/web3wallet/wallet_color.dart';
import 'package:flutter_beautiful_ui/web3wallet/widget/blur_color_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class WalletPriceAlertsPage extends StatefulWidget {
  const WalletPriceAlertsPage({super.key});

  @override
  State<WalletPriceAlertsPage> createState() => _WalletPriceAlertsPageState();
}

class _WalletPriceAlertsPageState extends State<WalletPriceAlertsPage> {
  final List<String> _moneyType = [
    Assets.images.web3wallet.walletBitcoin,
    Assets.images.web3wallet.walletNeo,
    Assets.images.web3wallet.walletAchain,
  ];

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Color(0xfff3f5f6),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              right: -30,
              child: BlurColorWidget(size: 150, color: Color(0xffFFC2C6)),
            ),
            Positioned(
              top: -50,
              right: 100,
              child: BlurColorWidget(
                size: 210,
                color: Color(0xffE8D5FF),
                blurRadius: 120,
              ),
            ),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    style: IconButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.keyboard_arrow_left_outlined),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: h * 0.01,
                    ),
                    child: Text(
                      "Price Alerts",
                      style: TextStyle(
                        fontSize: TextTheme.of(context).titleLarge?.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF7F7FA).withAlpha(100),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.all(horizontalPadding),
                    child: Column(
                      children: _moneyType.map((value) {
                        return Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: WalletColor.moneyIconColor[value],
                                ),
                                child: SvgPicture.asset(value),
                              ),
                              title: Text(
                                "Bitcoin BTC",
                                style: TextStyle(
                                  fontSize: TextTheme.of(
                                    context,
                                  ).titleMedium?.fontSize,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add, color: Colors.blue),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffDEF5E9),
                                      ),
                                      child: Icon(
                                        Icons.keyboard_arrow_up,
                                        color: Color(0xff5FC88F),
                                        size: w * 0.08,
                                      ),
                                    ),
                                    title: Text(
                                      "Above \$ 1100,000",
                                      style: TextStyle(
                                        fontSize: TextTheme.of(
                                          context,
                                        ).bodyMedium?.fontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "3 mins ago",
                                      style: TextStyle(
                                        fontSize: TextTheme.of(
                                          context,
                                        ).bodySmall?.fontSize,
                                      ),
                                    ),
                                    trailing: Transform.scale(
                                      scale: 0.8,
                                      child: Switch(
                                        activeThumbColor: Colors.white,
                                        activeTrackColor: Color(0xff767DFF),
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffFFDBDB),
                                      ),
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Color(0xffFF6464),
                                        size: w * 0.08,
                                      ),
                                    ),
                                    title: Text(
                                      "Above \$ 1100,000",
                                      style: TextStyle(
                                        fontSize: TextTheme.of(
                                          context,
                                        ).bodyMedium?.fontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "3 mins ago",
                                      style: TextStyle(
                                        fontSize: TextTheme.of(
                                          context,
                                        ).bodySmall?.fontSize,
                                      ),
                                    ),
                                    trailing: Transform.scale(
                                      scale: 0.8,
                                      child: Switch(
                                        activeThumbColor: Colors.white,
                                        activeTrackColor: Color(0xff767DFF),
                                        inactiveThumbColor: Colors.white,
                                        inactiveTrackColor: Color(0xffE0E2FF),
                                        trackOutlineColor:
                                            WidgetStateProperty.all(
                                              Colors.transparent,
                                            ),
                                        value: false,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
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
