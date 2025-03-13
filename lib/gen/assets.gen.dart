/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.png');

  /// File path: assets/images/card_background.png
  AssetGenImage get cardBackground =>
      const AssetGenImage('assets/images/card_background.png');

  /// File path: assets/images/card_logo.png
  AssetGenImage get cardLogo =>
      const AssetGenImage('assets/images/card_logo.png');

  /// File path: assets/images/card_rectangle.png
  AssetGenImage get cardRectangle =>
      const AssetGenImage('assets/images/card_rectangle.png');

  /// File path: assets/images/card_right_circle.png
  AssetGenImage get cardRightCircle =>
      const AssetGenImage('assets/images/card_right_circle.png');

  /// File path: assets/images/createdByMeImg1.png
  AssetGenImage get createdByMeImg1 =>
      const AssetGenImage('assets/images/createdByMeImg1.png');

  /// File path: assets/images/createdByMeImg2.png
  AssetGenImage get createdByMeImg2 =>
      const AssetGenImage('assets/images/createdByMeImg2.png');

  /// File path: assets/images/createdByMeImg3.png
  AssetGenImage get createdByMeImg3 =>
      const AssetGenImage('assets/images/createdByMeImg3.png');

  /// File path: assets/images/createdByMeImg4.png
  AssetGenImage get createdByMeImg4 =>
      const AssetGenImage('assets/images/createdByMeImg4.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/notification.png
  AssetGenImage get notification =>
      const AssetGenImage('assets/images/notification.png');

  /// File path: assets/images/phone_icon.png
  AssetGenImage get phoneIcon =>
      const AssetGenImage('assets/images/phone_icon.png');

  /// File path: assets/images/right_circle.png
  AssetGenImage get rightCircle =>
      const AssetGenImage('assets/images/right_circle.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        background,
        cardBackground,
        cardLogo,
        cardRectangle,
        cardRightCircle,
        createdByMeImg1,
        createdByMeImg2,
        createdByMeImg3,
        createdByMeImg4,
        logo,
        notification,
        phoneIcon,
        rightCircle
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    FilterQuality filterQuality = FilterQuality.low,
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
