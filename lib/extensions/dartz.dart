import 'package:dartz/dartz.dart';

extension EitherX<L extends Object, R> on Either<L, R> {
  Left<L, Never> asLeft() {
    return fold(
      (L l) => Left<L, Never>(l),
      (R r) => throw AssertionError('asLeft() is called on Right'),
    );
  }

  Right<Never, R> asRight() {
    return fold(
      (L l) => throw AssertionError('asRight() is called on Left'),
      (R r) => Right<Never, R>(r),
    );
  }

  R? getOrNull() => fold((L l) => null, id);
}

extension EitherExceptionX<L extends Exception, R> on Either<L, R> {
  void throwIfLeft() => fold((L l) => throw l, (R r) {});

  R getOrThrow() => fold((L l) => throw l, (R r) => r);
}

extension FutureEitherX<L extends Exception, R> on Future<Either<L, R>> {
  Future<void> throwIfLeft() =>
      then((Either<L, R> either) => either.throwIfLeft());

  Future<R> getOrThrow() => then((Either<L, R> either) => either.getOrThrow());

  Future<Either<L, R2>> map<R2>(R2 Function(R) func) async {
    return (await this).map(func);
  }
}

Either<Exception, A> catchingException<A>(Function0<A> f) {
  try {
    return right(f());
  } on Exception catch (e) {
    return left(e);
  }
}

Future<Either<Exception, A>> catchingExceptionFuture<A>(
    Function0<Future<A>> f) async {
  try {
    return right(await f());
  } on Exception catch (e) {
    return left(e);
  }
}

extension Tuple2ToArrayX<T> on Tuple2<T, T> {
  List<T> toList() => <T>[value1, value2];
}
