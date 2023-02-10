import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BitmapDescriptorHelper {
  BitmapDescriptorHelper._();

  static Future<BitmapDescriptor> getBitmapDescriptorFromSvgAsset(
    BuildContext context,
    String assetName,
    String? packageName,
    AssetBundle? assetBundle,
    SvgTheme? theme,
    Size size,
  ) async {
    final SvgAssetLoader svgAssetLoader = SvgAssetLoader(
      assetName,
      packageName: packageName,
      assetBundle: assetBundle,
      theme: theme ?? const SvgTheme(),
    );
    final ByteData byteData = await svgAssetLoader.loadBytes(context);
    final Uint8List unit8List = byteData.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(unit8List, size: size);
  }

  static Future<BitmapDescriptor> getBitmapDescriptorFromSvgString(
    BuildContext context,
    String svgString,
    SvgTheme? theme,
    Size size,
  ) async {
    final SvgStringLoader svgStringLoader = SvgStringLoader(
      svgString,
      theme: theme ?? const SvgTheme(),
    );

    final ByteData byteData = await svgStringLoader.loadBytes(context);
    final Uint8List unit8List = byteData.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(unit8List, size: size);
  }

  static Future<ui.Image> _getSizedSvgImage(
    ui.Image svgImage,
    Size size,
  ) async {
    final double width = size.width * ui.window.devicePixelRatio;
    final double height = size.height * ui.window.devicePixelRatio;

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Rect svgRect = Rect.fromLTRB(
        0.0, 0.0, svgImage.width.toDouble(), svgImage.height.toDouble());
    final Rect sizedRect =
        Rect.fromLTRB(0.0, 0.0, width, height); // owr size here
    canvas.drawImageRect(svgImage, svgRect, sizedRect, Paint());
    return pictureRecorder
        .endRecording()
        .toImage(width.toInt(), height.toInt());
  }
}
