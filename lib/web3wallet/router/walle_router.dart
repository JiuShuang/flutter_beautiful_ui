import 'package:flutter_beautiful_ui/web3wallet/presentation/coin_detail/wallet_coin_detail_page.dart';
import 'package:flutter_beautiful_ui/web3wallet/presentation/navigation/wallet_navigation_page.dart';
import 'package:flutter_beautiful_ui/web3wallet/presentation/login/wallet_login_page.dart';
import 'package:go_router/go_router.dart';

class WalleRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => WalletLoginPage()),
      GoRoute(
        path: '/home',
        builder: (context, state) => WalletNavigationPage(),
      ),
      GoRoute(
        path: '/coin/detail',
        builder: (context, state) => WalletCoinDetailPage(),
      ),
    ],
  );
}
