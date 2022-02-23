import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: SvgPicture.asset(
          "assets/login_or_register.svg",
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
