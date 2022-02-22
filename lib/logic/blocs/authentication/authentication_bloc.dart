import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:utopia_recruitment_task/logic/service/auth_service.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService _authService;

  AuthenticationBloc({required AuthService authService})
      : _authService = authService,
        super(AuthenticationInitial()) {
    on<AppStarted>(_mapAppStartedToState);
    on<LoggedIn>(_mapLoggedInToState);
    on<LoggedOut>(_mapLoggedOutToState);
  }

  void _mapAppStartedToState(AppStarted event, Emitter<AuthenticationState> emit) {
    try {
      emit(AuthenticationInitial());
      final isSignedIn = _authService.isSignedIn();
      isSignedIn ? emit(AuthenticationAuthenticated(_authService.getUser())) : emit(AuthenticationUnauthenticated());
    } catch (_) {
      emit(AuthenticationUnauthenticated());
    }
  }

  void _mapLoggedInToState(LoggedIn event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationAuthenticated(_authService.getUser()));
  }

  void _mapLoggedOutToState(LoggedOut event, Emitter<AuthenticationState> emit) {
    _authService.signOut();
    emit(AuthenticationUnauthenticated());
  }
}
