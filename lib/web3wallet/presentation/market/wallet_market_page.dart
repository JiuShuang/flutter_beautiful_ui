import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/gen/assets.gen.dart';
import 'package:flutter_beautiful_ui/web3wallet/presentation/market/widget/wallet_market_search.dart';
import 'package:flutter_beautiful_ui/web3wallet/presentation/market/widget/wallet_market_trend_list.dart';

class WalletMarketPage extends StatefulWidget {
  const WalletMarketPage({super.key});

  @override
  State<WalletMarketPage> createState() => _WalletMarketPageState();
}

class _WalletMarketPageState extends State<WalletMarketPage> {
  final Map<String, String> _marketType = {
    Assets.images.web3wallet.walletWahchlists: "Watchlists",
    Assets.images.web3wallet.walletTrending: "Trending",
    Assets.images.web3wallet.walleBest: "Best Value",
  };

  final List<String> _moneyType = [
    Assets.images.web3wallet.walletBitcoin,
    Assets.images.web3wallet.walletNeo,
    Assets.images.web3wallet.walletAchain,
  ];

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = MediaQuery.sizeOf(context).width * 0.05;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          title: Text(
            "Market",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: TextTheme.of(context).titleLarge?.fontSize,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: WalletMarketSearch(marketType: _marketType),
          ),
        ),
        WalletMarketTrendList(moneyType: _moneyType)
      ],
    );
  }
}
