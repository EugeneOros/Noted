import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_recruitment_task/logic/blocs/notes/notes_bloc.dart';
import 'package:utopia_recruitment_task/logic/model/note/note.dart';

import 'background_image.dart';
import 'item/note_item.dart';

class NotesList extends StatelessWidget {
  final List<Note> notes;

  const NotesList({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onEditNote(Note note) {
      Navigator.of(context).pushNamed(
        "/add_edit_note",
        arguments: [
          note,
          (title, url, noteText) {
            BlocProvider.of<NotesBloc>(context).add(UpdateNote(note.copyWith(
              note: noteText,
              url: url,
              title: title,
            )));
          },
        ],
      );
    }

    return Stack(
      children: [
        Positioned(child: const BackgroundImage()),
        Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              Note note = notes[index];
              return NoteItem(
                note: note,
                onDelete: () => BlocProvider.of<NotesBloc>(context).add(DeleteNote(note)),
                onEdit: () => _onEditNote(note),
              );
            },
          ),
        ),
      ],
    );
  }
}
