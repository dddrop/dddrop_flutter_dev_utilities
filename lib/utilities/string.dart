import 'dart:convert';

import 'package:crypto/crypto.dart';

String generateMd5(String data) {
  return md5.convert(utf8.encode(data)).toString();
}

String sha256ofString(String input) {
  final List<int> bytes = utf8.encode(input);
  final Digest digest = sha256.convert(bytes);
  return digest.toString();
}
