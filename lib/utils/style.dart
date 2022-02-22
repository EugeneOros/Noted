import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/config/colors.dart';

double getElevation(Set<MaterialState> states, {double usual = 8, double focused = 20, double pressed = 0, double disabled = 0}) {
  if (states.contains(MaterialState.pressed)) {
    return pressed;
  } else if (states.contains(MaterialState.disabled)) {
    return disabled;
  } else if (states.contains(MaterialState.focused)) {
    return focused;
  }
  return usual;
}

Color getColor(
  Set<MaterialState> states, {
  Color usual = primaryColor,
  Color focused = darkColor,
  Color pressed = darkColor,
  Color disabled = greyColor,
  Color selected = darkColor,
  bool isSelected = false,
}) {
  if (isSelected) {
    return darkColor;
  } else if (states.contains(MaterialState.pressed)) {
    return pressed;
  } else if (states.contains(MaterialState.disabled)) {
    return disabled;
  } else if (states.contains(MaterialState.focused)) {
    return focused;
  }
  return usual;
}
