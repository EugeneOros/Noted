import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_recruitment_task/app.dart';
import 'package:utopia_recruitment_task/logic/blocs/login_register/login_register_bloc.dart';
import 'package:utopia_recruitment_task/logic/blocs/note_link/link_bloc.dart';
import 'package:utopia_recruitment_task/logic/blocs/notes/notes_bloc.dart';

import 'logic/blocs/authentication/authentication_bloc.dart';
import 'logic/service/auth_service.dart';
import 'logic/service/note_service.dart';

Future<List<BlocProvider<Object?>>> _getBlocProviders() async {
  // Services
  final AuthService _authService = AuthService();
  final NoteService _itemService = NoteService();

  // Blocs
  final authBloc = AuthenticationBloc(authService: _authService)..add(AppStarted());
  final notesBloc = NotesBloc(notesService: _itemService, authenticationBloc: authBloc); //..note_link(LoadNotes());
  final loginBloc = LoginRegisterBloc(authService: _authService);
  final linkBloc = LinkBloc();


  // BlocProviders
  return [
    BlocProvider<AuthenticationBloc>(
      create: (context) => authBloc,
    ),
    BlocProvider<LoginRegisterBloc>(
      create: (context) => loginBloc,
    ),
    BlocProvider<NotesBloc>(
      lazy: false,
      create: (context) => notesBloc,
    ),
    BlocProvider<LinkBloc>(
      create: (context) => linkBloc,
    ),
  ];
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiBlocProvider(
      providers: await _getBlocProviders(),
      child: const MyApp(),
    ),
  );
}
