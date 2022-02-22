import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? backgroundColor;
  final Color? indicatorColor;
  final double? height;

  const LoadingIndicator({Key? key, this.backgroundColor, this.indicatorColor, this.height} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: backgroundColor ?? Colors.transparent,
      child: Center(
        child: SpinKitRing(
          color: indicatorColor ?? Theme.of(context).colorScheme.primary,
          lineWidth: 4,
          size: 40.0,
        ),
      ),
    );
  }
}