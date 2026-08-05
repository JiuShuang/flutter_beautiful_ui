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

  /// File path: images/add.svg
  String get add => 'images/add.svg';

  /// File path: images/ai.png
  AssetGenImage get ai => const AssetGenImage('images/ai.png');

  /// File path: images/apple.svg
  String get apple => 'images/apple.svg';

  /// File path: images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('images/avatar.png');

  /// File path: images/email.svg
  String get email => 'images/email.svg';

  /// File path: images/facebook.svg
  String get facebook => 'images/facebook.svg';

  /// File path: images/google.svg
  String get google => 'images/google.svg';

  /// File path: images/image.svg
  String get image => 'images/image.svg';

  /// File path: images/loginPic.png
  AssetGenImage get loginPic => const AssetGenImage('images/loginPic.png');

  /// File path: images/misco.svg
  String get misco => 'images/misco.svg';

  /// File path: images/password.svg
  String get password => 'images/password.svg';

  /// File path: images/robot.svg
  String get robot => 'images/robot.svg';

  /// File path: images/search.svg
  String get search => 'images/search.svg';

  /// File path: images/up.svg
  String get up => 'images/up.svg';

  /// File path: images/video.svg
  String get video => 'images/video.svg';

  /// File path: images/vip.svg
  String get vip => 'images/vip.svg';

  /// File path: images/voice.svg
  String get voice => 'images/voice.svg';

  /// List of all assets
  List<dynamic> get values => [
        add,
        ai,
        apple,
        avatar,
        email,
        facebook,
        google,
        image,
        loginPic,
        misco,
        password,
        robot,
        search,
        up,
        video,
        vip,
        voice
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
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
