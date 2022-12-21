import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BitmapDescriptorHelper {
  BitmapDescriptorHelper._();

  static Future<BitmapDescriptor> getBitmapDescriptorFromSvgAsset(
      BuildContext context, String svgAssetLink) async {
    final ui.Image svgImage =
        await _getSvgImageFromAssets(context, svgAssetLink);
    final ui.Image sizedSvgImage = await _getSizedSvgImage(svgImage);

    final ByteData? pngSizedBytes =
        await sizedSvgImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List? unit8List = pngSizedBytes?.buffer.asUint8List();
    if (unit8List == null) {
      throw Exception('Uint8List is null');
    }
    return BitmapDescriptor.fromBytes(unit8List);
  }

  static Future<BitmapDescriptor> getBitmapDescriptorFromSvgString(
      String svgString) async {
    final ui.Image svgImage = await _getSvgImageFromString(svgString);
    final ui.Image sizedSvgImage = await _getSizedSvgImage(svgImage);

    final ByteData? pngSizedBytes =
        await sizedSvgImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List? unit8List = pngSizedBytes?.buffer.asUint8List();
    if (unit8List == null) {
      throw Exception('Uint8List is null');
    }
    return BitmapDescriptor.fromBytes(unit8List);
  }

  static Future<ui.Image> _getSvgImageFromAssets(
      BuildContext context, String svgAssertLink) async {
    final String svgString =
        await DefaultAssetBundle.of(context).loadString(svgAssertLink);
    final DrawableRoot drawableRoot = await svg.fromSvgString(svgString, '');
    final ui.Picture picture = drawableRoot.toPicture();
    final ui.Image image = await picture.toImage(
        drawableRoot.viewport.width.toInt(),
        drawableRoot.viewport.height.toInt());
    return image;
  }

  static Future<ui.Image> _getSvgImageFromString(String svgString) async {
    final DrawableRoot drawableRoot = await svg.fromSvgString(svgString, '');
    final ui.Picture picture = drawableRoot.toPicture();
    final ui.Image image = await picture.toImage(
        drawableRoot.viewport.width.toInt(),
        drawableRoot.viewport.height.toInt());
    return image;
  }

  static Future<ui.Image> _getSizedSvgImage(ui.Image svgImage) async {
    final double size = 50 * ui.window.devicePixelRatio;
    final double width = size;
    final double height = width;

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
