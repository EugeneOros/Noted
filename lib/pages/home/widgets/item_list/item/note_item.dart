import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:utopia_recruitment_task/logic/model/note/note.dart';
import 'package:utopia_recruitment_task/pages/home/widgets/item_list/item/delete_action_pane.dart';
import 'package:utopia_recruitment_task/pages/home/widgets/item_list/item/footer.dart';
import 'package:utopia_recruitment_task/widgets/buttons/surface_button.dart';

class NoteItem extends StatelessWidget {
  final Function onDelete;
  final Function onEdit;
  final Note note;
  final SlidableController? slidableController;

  const NoteItem({Key? key, required this.note, this.slidableController, required this.onDelete, required this.onEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(note.id!),
      endActionPane: getDeleteActionPane(context, onDelete),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SurfaceButton(
          onPressed: () => onEdit(),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(note.title, style: Theme.of(context).textTheme.bodyText1),
                      SizedBox(height: 5),
                      Text(
                        note.note.toString().replaceAll(' ', '\u00A0'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ItemFooter(createdDate: note.created)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
