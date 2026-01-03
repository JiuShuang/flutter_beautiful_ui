import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/gen/assets.gen.dart';
import 'package:flutter_beautiful_ui/web3wallet/wallet_color.dart';
import 'package:flutter_svg/svg.dart';

class WalletHistoryPage extends StatefulWidget {
  const WalletHistoryPage({super.key});

  @override
  State<WalletHistoryPage> createState() => _WalletHistoryPageState();
}

class _WalletHistoryPageState extends State<WalletHistoryPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  final List<String> _moneyType = [
    Assets.images.web3wallet.walletBitcoin,
    Assets.images.web3wallet.walletNeo,
    Assets.images.web3wallet.walletAchain,
  ];
  bool _isHostory = true;

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
  Widget build(BuildContext context) {
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    final double h = MediaQuery.sizeOf(context).height;
    final double w = MediaQuery.sizeOf(context).width;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: false,
          toolbarHeight: h * 0.1,
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Wallet Value",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: TextTheme.of(context).titleLarge?.fontSize,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.01),
                child: Text(
                  "\$29,100.50",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
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
                    curve: Curves.easeInOut,
                    top: 5,
                    bottom: 5,
                    left: _isHostory
                        ? horizontalPadding +
                              (w - horizontalPadding * 2 - 10) / 2
                        : 10,
                    child: Container(
                      width: w / 2.5,
                      height: h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(70),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isHostory = false;
                          });
                        },
                        child: AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 500),
                          style: TextStyle(
                            color: !_isHostory
                                ? Colors.black
                                : Color(0xff9395A5),
                            fontWeight: FontWeight.bold,
                          ),
                          child: Text("Porfolio"),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isHostory = true;
                          });
                        },
                        child: AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 500),
                          style: TextStyle(
                            color: _isHostory
                                ? Colors.black
                                : Color(0xff9395A5),
                            fontWeight: FontWeight.bold,
                          ),
                          child: Text("History"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverList.builder(
          itemCount: _moneyType.length + 1,
          itemBuilder: (context, index) {
            final Animation animation = CurvedAnimation(
              parent: controller,
              curve: Interval(
                1 / (_moneyType.length + 1) * index,
                1 / (_moneyType.length + 1) * (index + 1),
              ),
            );
            late Widget sliverWidget;
            if (index == 0) {
              sliverWidget = Padding(
                padding: EdgeInsets.symmetric(
                  vertical: h * 0.01,
                  horizontal: horizontalPadding,
                ),
                child: Text(
                  "12 June 2021",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff9395A4),
                  ),
                ),
              );
            } else {
              sliverWidget = Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: w * 0.04),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            WalletColor.moneyIconColor[_moneyType[index - 1]],
                      ),
                      child: SvgPicture.asset(_moneyType[index - 1]),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bitcoin",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "11:34 AM",
                            style: TextStyle(
                              color: Color(0xff9395A4),
                              fontSize: TextTheme.of(
                                context,
                              ).bodySmall?.fontSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "BTC 0.00056",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$950.50",
                          style: TextStyle(
                            fontSize: TextTheme.of(context).bodySmall?.fontSize,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, 20.0 * (1 - animation.value)),
                  child: Opacity(opacity: animation.value, child: child),
                );
              },
              child: sliverWidget,
            );
          },
        ),
      ],
    );
  }
}
