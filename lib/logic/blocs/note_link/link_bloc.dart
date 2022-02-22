import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'link_event.dart';

part 'link_state.dart';

class LinkBloc extends Bloc<LinkEvent, String?> {
  LinkBloc() : super(null) {
    on<LinkUpdated>((event, emit) {
      if (event.link == '' || event.link == null) {
        emit(null);
      } else {
        emit(event.link);
      }
    });
  }
}
