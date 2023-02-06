import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BitmapDescriptorHelper {
  BitmapDescriptorHelper._();

  static Future<BitmapDescriptor> getBitmapDescriptorFromSvgAsset(
    BuildContext context,
    String svgAssetLink,
  ) async {
    return SvgAssetLoader(svgAssetLink).loadBytes(context).then(
        (ByteData value) =>
            BitmapDescriptor.fromBytes(value.buffer.asUint8List()));
  }

  static Future<BitmapDescriptor> getBitmapDescriptorFromSvgString(
    BuildContext context,
    String svgString,
  ) {
    return SvgStringLoader(svgString).loadBytes(context).then(
        (ByteData value) =>
            BitmapDescriptor.fromBytes(value.buffer.asUint8List()));
  }
}
