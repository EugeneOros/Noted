import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:utopia_recruitment_task/logic/blocs/authentication/authentication_bloc.dart';
import 'package:utopia_recruitment_task/logic/model/note/note.dart';
import 'package:utopia_recruitment_task/logic/service/note_service.dart';

part 'notes_event.dart';

part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NoteService _noteService;
  StreamSubscription? _notesSubscription;
  StreamSubscription? _authenticationSubscription;

  NotesBloc({
    required NoteService notesService,
    required AuthenticationBloc authenticationBloc,
  })  : _noteService = notesService,
        super(NotesLoading()) {
    _authenticationSubscription = authenticationBloc.stream.listen(
      (state) {
        if (state is AuthenticationAuthenticated) {
          add(LoadNotes());
        }
      },
    );
    on<LoadNotes>(_mapLoadNotesToState);
    on<AddNote>(_mapAddNoteToState);
    on<UpdateNote>(_mapUpdateNoteToState);
    on<DeleteNote>(_mapDeleteNoteToState);
    on<NotesUpdated>(_mapNotesUpdateToState);
  }

  void _mapLoadNotesToState(LoadNotes event, Emitter<NotesState> emit) {
    _notesSubscription?.cancel();
    _notesSubscription = _noteService.notes().listen(
          (notes) => add(NotesUpdated(notes)),
        );
  }

  void _mapAddNoteToState(AddNote event, Emitter<NotesState> emit) {
    _noteService.addNewNote(event.note);
  }

  void _mapUpdateNoteToState(UpdateNote event, Emitter<NotesState> emit) {
    _noteService.updateNote(event.updatedNote);
  }

  void _mapDeleteNoteToState(DeleteNote event, Emitter<NotesState> emit) {
    _noteService.deleteNote(event.note);
  }

  void _mapNotesUpdateToState(NotesUpdated event, Emitter<NotesState> emit) {
    emit(NotesLoaded(event.notes));
  }

  @override
  Future<void> close() {
    _notesSubscription?.cancel();
    _authenticationSubscription?.cancel();
    return super.close();
  }
}
