import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';

String generateMd5(String data) {
  return md5.convert(utf8.encode(data)).toString();
}

String sha256ofString(String input) {
  final List<int> bytes = utf8.encode(input);
  final Digest digest = sha256.convert(bytes);
  return digest.toString();
}

Uint8List randomBytes(int length, {bool secure = false}) {
  assert(length > 0);

  final Random random = secure ? Random.secure() : Random();
  final Uint8List ret = Uint8List(length);

  for (int i = 0; i < length; i++) {
    ret[i] = random.nextInt(256);
  }

  return ret;
}

String generateFirestoreDocId([int length = 20]) {
  const String chars =
      r'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  String autoId = '';
  while (autoId.length < length) {
    final Uint8List bytes = randomBytes(40);
    for (final int b in bytes) {
      const int maxValue = 62 * 4 - 1;
      if (autoId.length < 20 && b <= maxValue) {
        autoId += chars[b % 62];
      }
    }
  }
  return autoId;
}
