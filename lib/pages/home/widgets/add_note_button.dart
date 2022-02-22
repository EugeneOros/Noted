import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_recruitment_task/logic/blocs/notes/notes_bloc.dart';
import 'package:utopia_recruitment_task/logic/model/note/note.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onAddNote() {
      Navigator.of(context).pushNamed(
        "/add_edit_note",
        arguments: [
          null,
          (title, url, noteText) {
            BlocProvider.of<NotesBloc>(context).add(AddNote(
              Note(
                note: noteText,
                url: url,
                title: title,
                created: DateTime.now(),
              ),
            ));
          }
        ],
      );
    }

    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white),
      backgroundColor: Theme.of(context).colorScheme.primary,
      onPressed: _onAddNote,
    );
  }
}
