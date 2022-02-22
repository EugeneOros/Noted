import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Container(
        alignment: Alignment.center,
        child: SvgPicture.asset(
          "assets/notebook.svg",
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
