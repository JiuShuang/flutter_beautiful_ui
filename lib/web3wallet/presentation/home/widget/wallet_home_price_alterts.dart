import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/web3wallet/wallet_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class WalletHomePriceAlterts extends StatefulWidget {
  final List<String> alertsIcons;
  const WalletHomePriceAlterts({super.key, required this.alertsIcons});

  @override
  State<WalletHomePriceAlterts> createState() => _WalletHomePriceAltertsState();
}

class _WalletHomePriceAltertsState extends State<WalletHomePriceAlterts> {
  int _alertsNotFoldCount = 0;

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: h * 0.01),
          child: Text(
            "Price Alerts",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: TextTheme.of(context).titleMedium?.fontSize,
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: h * 0.15 * _alertsNotFoldCount + 120,
          child: Stack(
            children: List<Widget>.generate(widget.alertsIcons.length, (index) {
              late double topOffset = 0;
              late double horizontalOffset;
              late double opacity;
              bool isStack= index>_alertsNotFoldCount;
              bool isFoldTop = _alertsNotFoldCount == index ? true : false;
              if (isFoldTop || index <= _alertsNotFoldCount) {
                horizontalOffset = 0;
              } else {
                horizontalOffset = (index - _alertsNotFoldCount) * 15;
              }
              if (index <= _alertsNotFoldCount) {
                topOffset = (h * 0.15 + 10) * index;
                opacity = 1;
              } else {
                topOffset =
                    (h * 0.15 + 10) * _alertsNotFoldCount +
                    (index - _alertsNotFoldCount) * 20;
                opacity = 0.8 / (index - _alertsNotFoldCount);
              }
              return AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                top: topOffset,
                left: horizontalOffset,
                right: horizontalOffset,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: opacity,
                  child: PriceAlertsWidget(
                    isStack: isStack,
                    onChangeFold: (value) {
                      setState(() {
                        if (value) {
                          _alertsNotFoldCount--;
                        } else {
                          _alertsNotFoldCount++;
                        }
                      });
                    },
                    icon: widget.alertsIcons[index],
                    text: "BTCUSDT just went above\n30123.232",
                  ),
                ),
              );
            }).reversed.toList(),
          ),
        ),
      ],
    );
  }
}

class PriceAlertsWidget extends StatefulWidget {
  final String icon;
  final String text;
  final bool isStack;
  final ValueChanged<bool> onChangeFold;
  const PriceAlertsWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onChangeFold,
    required this.isStack,
  });

  @override
  State<PriceAlertsWidget> createState() => _PriceAlertsWidgetState();
}

class _PriceAlertsWidgetState extends State<PriceAlertsWidget> {
  bool _isFolded = true;

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      padding: EdgeInsets.all(w * 0.03),
      height: _isFolded ? h * 0.09 : h * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: widget.isStack
          ? SizedBox.shrink()
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: WalletColor.moneyIconColor[widget.icon],
                        ),
                        child: SvgPicture.asset(widget.icon),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                          child: Text(
                            widget.text,
                            style: TextStyle(fontWeight: FontWeight.w600),
                            maxLines: 2,
                          ),
                        ),
                      ),
                      AnimatedRotation(
                        turns: _isFolded ? 0.25 : 0,
                        duration: Duration(milliseconds: 500),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _isFolded = !_isFolded;
                            });
                            widget.onChangeFold(_isFolded);
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: _isFolded
                                ? Color(0xffCED0DE)
                                : Color(0xffF7931A),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AnimatedSize(
                    duration: Duration(milliseconds: 500),
                    child: _isFolded
                        ? const SizedBox.shrink()
                        : Column(
                            children: [
                              Divider(color: Color(0xffE5E7F3)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text("Buy"),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text("Sell"),
                                  ),
                                  TextButton(
                                    onPressed: ()=>context.push("/priceAlerts"),
                                    child: Text("More"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
    );
  }
}
