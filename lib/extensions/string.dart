import '../utilities/string.dart';

extension StringExtension on String {
  String get md5 => generateMd5(this);

  String get sha256 => sha256ofString(this);
}
