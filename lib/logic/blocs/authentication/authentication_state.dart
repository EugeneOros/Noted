part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final User? user;

  const AuthenticationAuthenticated(this.user);

  @override
  List<Object?> get props => [user];

}

class AuthenticationUnauthenticated extends AuthenticationState {}
