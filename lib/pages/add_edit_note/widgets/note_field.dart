import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/config/colors.dart';

class NoteField extends StatefulWidget {
  final String text;
  final TextEditingController controller;

  const NoteField({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  @override
  _NoteFieldState createState() => _NoteFieldState();
}

class _NoteFieldState extends State<NoteField> {
  late TextEditingController controller;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    controller = widget.controller;
    controller.text = widget.text;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.text = widget.text;
    controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));

    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(selectionColor: Theme.of(context).colorScheme.secondary),
      ),
      child: TextFormField(
        cursorColor: Theme.of(context).colorScheme.onBackground,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hoverColor: Colors.red,
          contentPadding: EdgeInsets.zero,
          errorStyle: const TextStyle(height: 0),
          hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: greyColor),
          hintText: 'Start writing...',
        ),
        textAlign: TextAlign.left,
        focusNode: focusNode,
        controller: controller,
      ),
    );
  }
}
