import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class BottomSlidePageRouteBuilder<T> extends PageRouteBuilder<T> {
  BottomSlidePageRouteBuilder({required this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return SharedAxisTransition(
              transitionType: SharedAxisTransitionType.vertical,
              secondaryAnimation: secondaryAnimation,
              animation: animation,
              child: child,
            );
          },
        );

  final Widget widget;
}
