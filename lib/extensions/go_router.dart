import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension CustomTransitionPageX<T> on CustomTransitionPage<T> {
  static CustomTransitionPage<T> fade<T>(Widget child) =>
      CustomTransitionPage<T>(
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return FadeTransition(opacity: animation, child: child);
        },
      );

  static CustomTransitionPage<T> rightToLeft<T>(Widget child) =>
      CustomTransitionPage<T>(
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );

  static CustomTransitionPage<T> leftToRight<T>(Widget child) =>
      CustomTransitionPage<T>(
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );

  static CustomTransitionPage<T> topToBottom<T>(Widget child) =>
      CustomTransitionPage<T>(
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );

  static CustomTransitionPage<T> bottomToTop<T>(Widget child) =>
      CustomTransitionPage<T>(
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );

  static CustomTransitionPage<T> scale<T>(
    Widget child, {
    required Alignment alignment,
    required Curve curve,
  }) =>
      CustomTransitionPage<T>(
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return ScaleTransition(
            alignment: alignment,
            scale: CurvedAnimation(
              parent: animation,
              curve: Interval(
                0.00,
                0.50,
                curve: curve,
              ),
            ),
            child: child,
          );
        },
      );

  static CustomTransitionPage<T> rotate<T>(
    Widget child, {
    required Alignment alignment,
  }) =>
      CustomTransitionPage<T>(
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return RotationTransition(
            alignment: alignment,
            turns: animation,
            child: ScaleTransition(
              alignment: alignment,
              scale: animation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          );
        },
      );

  static CustomTransitionPage<T> size<T>(
    Widget child, {
    required Alignment alignment,
    required Curve curve,
  }) =>
      CustomTransitionPage<T>(
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return Align(
            alignment: alignment,
            child: SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: animation,
                curve: curve,
              ),
              child: child,
            ),
          );
        },
      );

  static CustomTransitionPage<T> rightToLeftWithFade<T>(Widget child) =>
      CustomTransitionPage<T>(
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
          );
        },
      );

  static CustomTransitionPage<T> leftToRightWithFade<T>(
    Widget child, {
    required Curve curve,
  }) =>
      CustomTransitionPage<T>(
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: curve,
              ),
            ),
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
          );
        },
      );

  static CustomTransitionPage<T> rightToLeftJoined<T>(
    Widget child, {
    Widget? childCurrent,
    required Curve curve,
  }) =>
      CustomTransitionPage<T>(
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return Stack(
            children: <Widget>[
              SlideTransition(
                position: Tween<Offset>(
                  end: const Offset(-1.0, 0.0),
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: childCurrent,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: child,
              )
            ],
          );
        },
      );

  static CustomTransitionPage<T> leftToRightJoined<T>(
    Widget child, {
    required Widget childCurrent,
    required Curve curve,
  }) =>
      CustomTransitionPage<T>(
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return Stack(
            children: <Widget>[
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: child,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  end: const Offset(1.0, 0.0),
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: childCurrent,
              )
            ],
          );
        },
      );

  static CustomTransitionPage<T> bottomToTopJoined<T>(
    Widget child, {
    required Widget childCurrent,
    required Curve curve,
  }) =>
      CustomTransitionPage<T>(
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return Stack(
            children: <Widget>[
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 1.0),
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: child,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  end: const Offset(0.0, -1.0),
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: childCurrent,
              )
            ],
          );
        },
      );

  static CustomTransitionPage<T> topToBottomJoined<T>(
    Widget child, {
    required Widget childCurrent,
    required Curve curve,
  }) =>
      CustomTransitionPage<T>(
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return Stack(
            children: <Widget>[
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, -1.0),
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: child,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  end: const Offset(0.0, 1.0),
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: curve,
                  ),
                ),
                child: childCurrent,
              )
            ],
          );
        },
      );
}
