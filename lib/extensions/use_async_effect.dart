import 'dart:async';

import 'package:flutter_hooks/flutter_hooks.dart';

void useAsyncEffect(FutureOr<Dispose?> Function() effect,
    [List<Object?>? keys]) {
  bool disposed = false;
  Dispose? dispose;
  useEffect(() {
    Future<void>.microtask(() async {
      dispose = await effect();
      if (disposed) {
        dispose?.call();
      }
    });
    return () {
      disposed = true;
      dispose?.call();
    };
  }, keys);
}
