import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_recruitment_task/logic/blocs/authentication/authentication_bloc.dart';
import 'package:utopia_recruitment_task/logic/model/note/note.dart';
import 'package:utopia_recruitment_task/pages/add_edit_note/view/add_edit_note_page.dart';
import 'package:utopia_recruitment_task/pages/home/view/home_page.dart';
import 'package:utopia_recruitment_task/pages/login_register/view/login_register_page.dart';
import 'package:utopia_recruitment_task/routes/bottom_slide_page_route.dart';
import 'package:utopia_recruitment_task/routes/right_slide_page_route.dart';
import 'package:utopia_recruitment_task/widgets/loading_indicator.dart';

typedef OnSaveCallback = Function(String title, String? note, String? url);

onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return BottomSlidePageRouteBuilder(
        widget: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationUnauthenticated) {
              return const LoginRegisterPage();
            } else if (state is AuthenticationAuthenticated) {
              return const HomePage();
            }
            return const Scaffold(body: LoadingIndicator());
          },
        ),
      );
    case '/add_edit_note':
      final args = settings.arguments as List;
      Note? note = args[0];
      OnSaveCallback onSave = args[1];
      return RightSlidePageRouteBuilder(
        widget: AddEditNotePage(note: note, onSave: onSave),
      );
  }
}
