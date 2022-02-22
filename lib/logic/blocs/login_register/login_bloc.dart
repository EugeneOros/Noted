import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:utopia_recruitment_task/logic/service/auth_service.dart';
import 'package:utopia_recruitment_task/utils/validators.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthService _authService;
  bool isHiddenPassword = true;

  EventTransformer<LoginEvent> debounce<LoginEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  LoginBloc({
    required AuthService authService,
  })  : _authService = authService,
        super(LoginState.empty()) {
    on<LoginEventEmailChanged>(_mapLoginEventEmailChanged,  transformer: debounce(const Duration(milliseconds: 300)));
    on<LoginEventPasswordChanged>(_mapLoginEventPasswordChanged,  transformer: debounce(const Duration(milliseconds: 300)));
    on<LoginEventWithCredentialsPressed>(_mapLoginWithCredentialsPressedToState);
    on<LoginEventShowHidePassword>((event, emit) {
      isHiddenPassword = !isHiddenPassword;
    });
  }


  void _mapLoginEventEmailChanged(LoginEventEmailChanged event, Emitter<LoginState> emit) {
    emit(state.update(isEmailValid: Validators.isValidEmail(event.email)));
  }

  void _mapLoginEventPasswordChanged(LoginEventPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.update(isPasswordValid: Validators.isValidPassword(event.password)));
  }

  Future<void> _mapLoginWithCredentialsPressedToState(LoginEventWithCredentialsPressed event, Emitter<LoginState> emit) async {
    emit(LoginState.loading());
    try {
      await _authService.logInOrRegister(event.email, event.password);
      emit(LoginState.success());
    } catch (_) {
      emit(LoginState.failure());
    }
  }
}
