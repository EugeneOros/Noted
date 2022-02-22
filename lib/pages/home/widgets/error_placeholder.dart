import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          'assets/data_error.svg',
          width: MediaQuery.of(context).size.width,
        ),
        Positioned.fill(
          bottom: 40,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Oops. Something went wrong',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
        )
      ],
    );
  }
}
