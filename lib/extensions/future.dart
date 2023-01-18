extension FutureX<T> on Future<T> {
  static Future<T> waitForAnimationDelay<T>({
    required int milliseconds,
    required Future<T> future,
  }) async {
    return (await Future.wait(<Future<T?>>[
      future,
      Future<T?>.delayed(Duration(milliseconds: milliseconds)),
    ]))
        .whereType<T>()
        .first;
  }
}
