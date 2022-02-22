import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotesPlaceholder extends StatelessWidget {
  const NotesPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/writing.svg',
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            'Create a new note',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
        )
      ],
    );
  }
}
