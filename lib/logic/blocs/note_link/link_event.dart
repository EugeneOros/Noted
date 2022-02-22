part of 'link_bloc.dart';

@immutable
abstract class LinkEvent extends Equatable {
  const LinkEvent();

  @override
  List<Object> get props => [];
}

class LinkUpdated extends LinkEvent {
  final String? link;

  const LinkUpdated({required this.link});
}
