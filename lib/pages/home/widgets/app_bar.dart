import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_recruitment_task/logic/blocs/authentication/authentication_bloc.dart';
import 'package:utopia_recruitment_task/widgets/icon_button_app_bar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      toolbarHeight: 50,
      shadowColor: Colors.transparent,
      backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      actions: [
        IconButtonAppBar(
          icon: Icons.logout,
          onPressed: () => BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut()),
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
