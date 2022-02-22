part of 'link_bloc.dart';

@immutable
abstract class LinkState extends Equatable {
  const LinkState();

  @override
  List<Object> get props => [];
}

class LinkHidden extends LinkState {}

class LinkShown extends LinkState {}
