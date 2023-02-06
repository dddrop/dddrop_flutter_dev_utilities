import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BitmapDescriptorHelper {
  BitmapDescriptorHelper._();

  static Future<BitmapDescriptor> getBitmapDescriptorFromSvgAsset(
    BuildContext context,
    String assetName,
    Size size,
  ) async {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    final String svgString =
        await DefaultAssetBundle.of(context).loadString(assetName);
    final double width = size.width * devicePixelRatio;
    final double height = size.height * devicePixelRatio;

    final SvgPicture svgPicture = SvgPicture.string(
      svgString,
      width: width,
      height: height,
    );

    // ignore: use_build_context_synchronously
    final ByteData bytes = await svgPicture.bytesLoader.loadBytes(context);

    return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
  }
}
