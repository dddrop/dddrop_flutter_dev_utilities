extension ListX<T> on List<T> {
  T? get firstOrNull => isNotEmpty ? first : null;

  T? get lastOrNull => isNotEmpty ? last : null;
}
