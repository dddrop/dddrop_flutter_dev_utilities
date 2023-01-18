import 'package:dddrop_flutter_dev_utilities/extensions/future.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('wait for animation delay', () async {
    final Future<int> future =
        Future<int>.delayed(const Duration(milliseconds: 100), () => 1);
    final int result = await FutureX.waitForAnimationDelay<int>(
        milliseconds: 500, future: future);
    expect(result, 1);
  });
}
