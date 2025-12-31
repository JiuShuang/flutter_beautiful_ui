import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletHomePage extends StatefulWidget {
  const WalletHomePage({super.key});

  @override
  State<WalletHomePage> createState() => _WalletHomePageState();
}

class _WalletHomePageState extends State<WalletHomePage> {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          titleSpacing: w*0.05,
          backgroundColor: Colors.transparent,
          title: Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: false,
        ),
        SliverToBoxAdapter(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: h * 0.15,
                width: w,
                margin: EdgeInsets.symmetric(horizontal: w*0.05),
                decoration: BoxDecoration(
                  color: Color(0xff9F9DF3),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(w * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Try our AI for avoid \n huge loss",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: TextTheme.of(context).bodyLarge?.fontSize,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(w * 0.25, h / 25),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Try Now",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: -h*0.015,
                child: Image.asset(
                  Assets.images.web3wallet.walletHomeRobot.path,
                  width: w*0.45,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
