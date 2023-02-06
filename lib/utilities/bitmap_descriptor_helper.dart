import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BitmapDescriptorHelper {
  BitmapDescriptorHelper._();

  static Future<BitmapDescriptor> getBitmapDescriptorFromSvgAsset(
    BuildContext context,
    String svgAssetLink,
    Size size,
  ) async {
    final SvgPicture svgPicture = SvgPicture.asset(svgAssetLink);
    final ByteData bytes = await svgPicture.bytesLoader.loadBytes(context);
    return BitmapDescriptor.fromBytes(
      bytes.buffer.asUint8List(),
      size: size,
    );
  }

  static Future<BitmapDescriptor> getBitmapDescriptorFromSvgString(
    BuildContext context,
    String svgString,
    Size size,
  ) {
    return SvgStringLoader(svgString).loadBytes(context).then(
          (ByteData value) => BitmapDescriptor.fromBytes(
            value.buffer.asUint8List(),
            size: size,
          ),
        );
  }
}
