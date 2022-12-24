extension GenericsX<A> on A {
  B let<B>(B Function(A) f) => f(this);
}
