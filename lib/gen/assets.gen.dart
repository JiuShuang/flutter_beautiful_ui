// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $ImagesGen {
  const $ImagesGen();

  /// Directory path: images/web3wallet
  $ImagesWeb3walletGen get web3wallet => const $ImagesWeb3walletGen();
}

class $ImagesWeb3walletGen {
  const $ImagesWeb3walletGen();

  /// File path: images/web3wallet/wallet_apple.png
  AssetGenImage get walletApple =>
      const AssetGenImage('images/web3wallet/wallet_apple.png');

  /// File path: images/web3wallet/wallet_facebook.png
  AssetGenImage get walletFacebook =>
      const AssetGenImage('images/web3wallet/wallet_facebook.png');

  /// File path: images/web3wallet/wallet_google.png
  AssetGenImage get walletGoogle =>
      const AssetGenImage('images/web3wallet/wallet_google.png');

  /// File path: images/web3wallet/wallet_home.svg
  String get walletHome => 'images/web3wallet/wallet_home.svg';

  /// File path: images/web3wallet/wallet_home_robot.png
  AssetGenImage get walletHomeRobot =>
      const AssetGenImage('images/web3wallet/wallet_home_robot.png');

  /// File path: images/web3wallet/wallet_login_robot.png
  AssetGenImage get walletLoginRobot =>
      const AssetGenImage('images/web3wallet/wallet_login_robot.png');

  /// File path: images/web3wallet/wallet_news.svg
  String get walletNews => 'images/web3wallet/wallet_news.svg';

  /// File path: images/web3wallet/wallet_profile.svg
  String get walletProfile => 'images/web3wallet/wallet_profile.svg';

  /// File path: images/web3wallet/wallet_rate.svg
  String get walletRate => 'images/web3wallet/wallet_rate.svg';

  /// File path: images/web3wallet/wallet_wallet.svg
  String get walletWallet => 'images/web3wallet/wallet_wallet.svg';

  /// List of all assets
  List<dynamic> get values => [
    walletApple,
    walletFacebook,
    walletGoogle,
    walletHome,
    walletHomeRobot,
    walletLoginRobot,
    walletNews,
    walletProfile,
    walletRate,
    walletWallet,
  ];
}

class Assets {
  const Assets._();

  static const $ImagesGen images = $ImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
