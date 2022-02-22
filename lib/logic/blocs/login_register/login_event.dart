part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEventEmailChanged extends LoginEvent {
  final String email;

  const LoginEventEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class LoginEventPasswordChanged extends LoginEvent {
  final String password;

  const LoginEventPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class LoginEventSubmitted extends LoginEvent {
  final String email;
  final String password;

  const LoginEventSubmitted({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginEventWithGooglePressed extends LoginEvent {}

class LoginEventWithCredentialsPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginEventWithCredentialsPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginEventShowHidePassword extends LoginEvent {}
