part of 'login_register_bloc.dart';

@immutable
abstract class LoginRegisterEvent extends Equatable {
  const LoginRegisterEvent();

  @override
  List<Object> get props => [];
}

class LoginEventEmailChanged extends LoginRegisterEvent {
  final String email;

  const LoginEventEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class LoginEventPasswordChanged extends LoginRegisterEvent {
  final String password;

  const LoginEventPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class LoginEventSubmitted extends LoginRegisterEvent {
  final String email;
  final String password;

  const LoginEventSubmitted({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginEventWithGooglePressed extends LoginRegisterEvent {}

class LoginEventWithCredentialsPressed extends LoginRegisterEvent {
  final String email;
  final String password;

  const LoginEventWithCredentialsPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginEventShowHidePassword extends LoginRegisterEvent {}
