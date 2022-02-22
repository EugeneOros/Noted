import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/config/colors.dart';
import 'package:utopia_recruitment_task/utils/style.dart';

class FillButton extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final double radius;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final TextStyle? textStyle;
  final bool isSelected;
  final double iconSize;

  final Color color;
  final Color selectedColor;
  final Color disabledColor;
  final Color textColor;
  final Color selectedTextColor;
  final Color? iconColor;

  const FillButton({
    Key? key,
    this.onPressed,
    this.padding = const EdgeInsets.all(10),
    this.width,
    this.height,
    this.leftIcon,
    this.rightIcon,
    this.title,
    this.textStyle,
    this.textColor = Colors.white,
    this.color = primaryColor,
    this.selectedColor = secondaryColor,
    this.selectedTextColor = Colors.white,
    this.isSelected = false,
    this.radius = 15,
    this.iconColor,
    this.iconSize = 25,
    this.disabledColor = greyColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _getEntryColor() {
      Color notSelectedColor = textColor;
      return isSelected ? selectedTextColor : notSelectedColor;
    }

    Color _iconColor = iconColor ?? _getEntryColor();
    TextStyle _textStyle = (textStyle ?? Theme.of(context).textTheme.button)!.copyWith(color: _getEntryColor());

    return ElevatedButton(
      onPressed: onPressed,
      child: IntrinsicHeight(
        child: IntrinsicWidth(
          child: SizedBox(
            width: width == null ? null : width! - 10,
            height: height == null ? null : height! - 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (leftIcon != null) Icon(leftIcon, color: _iconColor, size: iconSize),
                if (title != null)
                  Expanded(
                    child: Text(
                      title!.replaceAll(' ', '\u00A0'),
                      softWrap: false,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: _textStyle,
                    ),
                  ),
                if (rightIcon != null) Icon(rightIcon, color: _iconColor, size: iconSize)
              ],
            ),
          ),
        ),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(padding),
        foregroundColor: null,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))),
        elevation: MaterialStateProperty.resolveWith(getElevation),
        backgroundColor: MaterialStateProperty.resolveWith(
          (state) => getColor(state, usual: color, selected: selectedColor, isSelected: isSelected, disabled: disabledColor),
        ),
      ),
    );
  }
}
