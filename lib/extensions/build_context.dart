import 'package:flutter/widgets.dart';

extension BuildContextX on BuildContext {
  Size get size => MediaQuery.of(this).size;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}
