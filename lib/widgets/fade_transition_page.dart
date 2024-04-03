import 'package:flutter/cupertino.dart';

class FadeTransitionPage<T> extends Page<T> {
  final Widget child;
  final Duration duration;

  const FadeTransitionPage({
    super.key,
    super.restorationId,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return FadeTransitionRoute<T>(this);
  }
  
}

class FadeTransitionRoute<T> extends PageRoute<T> {

  FadeTransitionRoute(FadeTransitionPage<T> page)
    : super(settings: page) {
      assert(opaque);
    }

    FadeTransitionPage<T> get _page => settings as FadeTransitionPage<T>;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return _page.child; 
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
   Animation<double> secondaryAnimation, Widget child) {
    final tween = CurveTween(curve: Curves.easeInOut);

    return FadeTransition(
      opacity: animation.drive(tween),
      child: _page.child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => _page.duration;
  
}