extension GenericsExtension<A> on A {
  B let<B>(B Function(A) f) => f(this);
}
