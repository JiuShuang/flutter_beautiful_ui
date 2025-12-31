import 'package:flutter_beautiful_ui/gen/assets.gen.dart';
import 'package:flutter_beautiful_ui/web3wallet/presentation/home/wallet_home_page.dart';
import 'package:flutter_beautiful_ui/web3wallet/presentation/navigation/widget/wallet_bottom_navigation.dart';
import 'package:flutter_beautiful_ui/web3wallet/presentation/news/wallet_news_page.dart';
import 'package:flutter_beautiful_ui/web3wallet/presentation/profile/wallet_profile_page.dart';
import 'package:flutter_beautiful_ui/web3wallet/presentation/rate/wallet_rate_page.dart';
import 'package:flutter_beautiful_ui/web3wallet/presentation/wallet/wallet_wallet_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beautiful_ui/web3wallet/widget/blur_color_widget.dart';

class WalletNavigationPage extends StatefulWidget {
  const WalletNavigationPage({super.key});

  @override
  State<WalletNavigationPage> createState() => _WalletNavigationPageState();
}

class _WalletNavigationPageState extends State<WalletNavigationPage> {
  int _pageIndex = 0;

  final List<String> _navItemIcon = [
    Assets.images.web3wallet.walletHome,
    Assets.images.web3wallet.walletRate,
    Assets.images.web3wallet.walletWallet,
    Assets.images.web3wallet.walletNews,
    Assets.images.web3wallet.walletProfile,
  ];

  final List<Widget> _pages=[
    WalletHomePage(),
    WalletRatePage(),
    WalletWalletPage(),
    WalletNewsPage(),
    WalletProfilePage()
  ];
  

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.sizeOf(context).width;
    final double h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Color(0xfff3f5f6),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Positioned(
                top: h * 0.1,
                left: -w * 0.35,
                child: BlurColorWidget(size: 231, color: Color(0xffF3E9FF)),
              ),
              Positioned(
                right: -w * 0.2,
                bottom: h * 0.2,
                child: BlurColorWidget(size: 119, color: Color(0xffFFE3C9)),
              ),
              Positioned(
                bottom: -h * 0.1,
                right: -w * 0.3,
                child: BlurColorWidget(size: 251, color: Color(0xffFFC2C6)),
              ),
              _pages[_pageIndex],
              Positioned(
                bottom: 0,
                child: WalletBottomNavigation(
                  navItems: List<Widget>.generate(_navItemIcon.length, (index) {
                    return SvgPicture.asset(
                      _navItemIcon[index],
                      width: w * 0.06,
                      colorFilter: ColorFilter.mode(
                        index == _pageIndex ? Colors.black : Color(0xffCED0DE),
                        BlendMode.srcIn,
                      ),
                    );
                  }),
                  onNavChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}