import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderIcon extends StatelessWidget {
  const HeaderIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, shape: BoxShape.circle),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      child: Icon(
        FontAwesomeIcons.link,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
