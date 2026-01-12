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

  /// File path: images/analytics.svg
  String get analytics => 'images/analytics.svg';

  /// File path: images/arrow.svg
  String get arrow => 'images/arrow.svg';

  /// File path: images/avatar.jpg
  AssetGenImage get avatar => const AssetGenImage('images/avatar.jpg');

  /// File path: images/bag.svg
  String get bag => 'images/bag.svg';

  /// File path: images/calendar.svg
  String get calendar => 'images/calendar.svg';

  /// File path: images/dashboard.svg
  String get dashboard => 'images/dashboard.svg';

  /// File path: images/facebook.svg
  String get facebook => 'images/facebook.svg';

  /// File path: images/game.svg
  String get game => 'images/game.svg';

  /// File path: images/gmail.svg
  String get gmail => 'images/gmail.svg';

  /// File path: images/heart.svg
  String get heart => 'images/heart.svg';

  /// File path: images/iPhone12.png
  AssetGenImage get iPhone12 => const AssetGenImage('images/iPhone12.png');

  /// File path: images/invoice.svg
  String get invoice => 'images/invoice.svg';

  /// File path: images/light.svg
  String get light => 'images/light.svg';

  /// File path: images/logInImage.svg
  String get logInImage => 'images/logInImage.svg';

  /// File path: images/logo.svg
  String get logo => 'images/logo.svg';

  /// File path: images/logout.svg
  String get logout => 'images/logout.svg';

  /// File path: images/messages.svg
  String get messages => 'images/messages.svg';

  /// File path: images/notification.svg
  String get notification => 'images/notification.svg';

  /// File path: images/order.png
  AssetGenImage get order => const AssetGenImage('images/order.png');

  /// File path: images/product.svg
  String get product => 'images/product.svg';

  /// File path: images/schedule.svg
  String get schedule => 'images/schedule.svg';

  /// File path: images/setting.svg
  String get setting => 'images/setting.svg';

  /// File path: images/signUpImage.svg
  String get signUpImage => 'images/signUpImage.svg';

  /// File path: images/work.svg
  String get work => 'images/work.svg';

  /// List of all assets
  List<dynamic> get values => [
    analytics,
    arrow,
    avatar,
    bag,
    calendar,
    dashboard,
    facebook,
    game,
    gmail,
    heart,
    iPhone12,
    invoice,
    light,
    logInImage,
    logo,
    logout,
    messages,
    notification,
    order,
    product,
    schedule,
    setting,
    signUpImage,
    work,
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
