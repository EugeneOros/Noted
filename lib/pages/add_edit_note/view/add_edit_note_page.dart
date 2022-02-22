import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_recruitment_task/logic/blocs/note_link/link_bloc.dart';
import 'package:utopia_recruitment_task/logic/model/message_type.dart';
import 'package:utopia_recruitment_task/logic/model/note/note.dart';
import 'package:utopia_recruitment_task/pages/add_edit_note/widgets/app_bar.dart';
import 'package:utopia_recruitment_task/pages/add_edit_note/widgets/background_image.dart';
import 'package:utopia_recruitment_task/pages/add_edit_note/widgets/link_widget.dart';
import 'package:utopia_recruitment_task/widgets/app_snack_bar.dart';
import 'package:utopia_recruitment_task/pages/add_edit_note/widgets/note_field.dart';
import 'package:utopia_recruitment_task/pages/add_edit_note/widgets/title_field.dart';

typedef OnSaveCallback = Function(String title, String? note, String? url);

class AddEditNotePage extends StatelessWidget {
  final Note? note;
  final OnSaveCallback onSave;

  const AddEditNotePage({Key? key, required this.onSave, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController noteController = TextEditingController();
    TextEditingController linkController = TextEditingController();
    bool isEditing = note != null;
    BlocProvider.of<LinkBloc>(context).add(LinkUpdated(link: isEditing ? note!.url : null));

    void _onDone() {
      if (titleController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          getAppSnackBar(
            context: context,
            messageType: MessageType.warning,
            text: 'Please provide title of the note',
          ),
        );
      } else {
        String? link = BlocProvider.of<LinkBloc>(context).state;
        onSave(titleController.text, link, noteController.text);
        Navigator.pop(context, false);
      }
    }

    return Scaffold(
      appBar: NoteAppBar(
        onDone: _onDone,
      ),
      body: Stack(
        children: [
          Positioned(child: const BackgroundImage()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: ListView(
              children: [
                TitleField(
                  controller: titleController,
                  title: isEditing ? note!.title : '',
                ),
                SizedBox(height: 10),
                LinkWidget(
                  controller: linkController,
                ),
                SizedBox(height: 10),
                NoteField(
                  controller: noteController,
                  text: isEditing ? (note!.note ?? '') : '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
