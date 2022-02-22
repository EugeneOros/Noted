import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utopia_recruitment_task/config/colors.dart';
import 'package:utopia_recruitment_task/utils/style.dart';

class SurfaceButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final EdgeInsets? padding;
  const SurfaceButton({Key? key, required this.child, this.onPressed, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets _padding = padding ?? EdgeInsets.zero;
    final Color _color = Theme.of(context).colorScheme.surface;
    final Color _disableColor = _color;
    final Color _pressedColor = Theme.of(context).colorScheme.background;
    final SystemMouseCursor _cursors = onPressed == null ? SystemMouseCursors.basic : SystemMouseCursors.click;
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(_padding),
          shadowColor: MaterialStateProperty.all(darkBlueColor),
          alignment: Alignment.centerLeft,
          mouseCursor: MaterialStateProperty.all(_cursors),
          foregroundColor: null,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          elevation: MaterialStateProperty.resolveWith((state) => getElevation(state, usual: 2, pressed: 0, focused: 3)),
          backgroundColor: MaterialStateProperty.resolveWith((state) =>
              getColor(state, usual: _color, pressed: _pressedColor, disabled: _disableColor)),
        ),
        child: child);
  }
}
