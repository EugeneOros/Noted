import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/config/colors.dart';

class TitleField extends StatefulWidget {
  final String title;
  final TextEditingController controller;

  const TitleField({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  _TitleFieldState createState() => _TitleFieldState();
}

class _TitleFieldState extends State<TitleField> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    widget.controller.text = widget.title;
    widget.controller.selection = TextSelection.fromPosition(TextPosition(offset: widget.controller.text.length));
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        widget.controller.selection = TextSelection(baseOffset: 0, extentOffset: widget.controller.text.length);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.text = widget.title;
    widget.controller.selection = TextSelection.fromPosition(TextPosition(offset: widget.controller.text.length));

    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(selectionColor: Theme.of(context).colorScheme.secondary),
      ),
      child: TextFormField(
        cursorColor: Theme.of(context).colorScheme.primary,
        maxLines: null,
        keyboardType: TextInputType.text,
        style: Theme.of(context).textTheme.headline1!.copyWith(color: Theme.of(context).colorScheme.onBackground),
        decoration: InputDecoration(
          border: InputBorder.none,
          hoverColor: Colors.red,
          contentPadding: EdgeInsets.zero,
          errorStyle: const TextStyle(height: 0),
          hintStyle: Theme.of(context).textTheme.headline1!.copyWith(color: greyColor),
          hintText: 'Title',
        ),
        textAlign: TextAlign.left,
        focusNode: focusNode,
        controller: widget.controller,
      ),
    );
  }
}
