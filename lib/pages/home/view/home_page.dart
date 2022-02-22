import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_recruitment_task/logic/blocs/notes/notes_bloc.dart';
import 'package:utopia_recruitment_task/logic/model/note/note.dart';
import 'package:utopia_recruitment_task/pages/home/widgets/add_note_button.dart';
import 'package:utopia_recruitment_task/pages/home/widgets/app_bar.dart';
import 'package:utopia_recruitment_task/pages/home/widgets/error_placeholder.dart';
import 'package:utopia_recruitment_task/pages/home/widgets/item_list/notes_list.dart';
import 'package:utopia_recruitment_task/pages/home/widgets/notes_placeholder.dart';
import 'package:utopia_recruitment_task/widgets/loading_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor = Theme.of(context).colorScheme.secondary.withOpacity(0.5);

    return Scaffold(
      appBar: HomeAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const AddNoteButton(),
      body: BlocBuilder<NotesBloc, NotesState>(builder: (context, state) {
        if (state is NotesLoading) {
          return LoadingIndicator(backgroundColor: bgColor);
        } else if (state is NotesLoaded) {
          List<Note> notes = state.notes;
          return Container(
            color: bgColor,
            alignment: Alignment.center,
            child: notes.isNotEmpty ? NotesList(notes: notes) : const NotesPlaceholder(),
          );
        }
        return ErrorPlaceholder();
      }),
    );
  }
}
