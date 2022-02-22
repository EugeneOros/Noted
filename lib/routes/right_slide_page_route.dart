import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class RightSlidePageRouteBuilder<T> extends PageRouteBuilder<T> {
  RightSlidePageRouteBuilder({required this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return SharedAxisTransition(
              transitionType: SharedAxisTransitionType.horizontal,
              secondaryAnimation: secondaryAnimation,
              animation: animation,
              child: child,
            );
          },
        );

  final Widget widget;
}
