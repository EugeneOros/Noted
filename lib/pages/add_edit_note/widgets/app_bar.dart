import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/widgets/icon_button_app_bar.dart';

class NoteAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onDone;

  const NoteAppBar({Key? key, required this.onDone}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      elevation: 0.0,
      toolbarHeight: 50,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: IconButtonAppBar(
        icon: Icons.arrow_back_ios_rounded,
        onPressed: () => Navigator.pop(context, false),
      ),
      actions: [
        IconButtonAppBar(
          icon: Icons.done,
          onPressed: onDone,
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
