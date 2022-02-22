import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/config/colors.dart';
import 'package:utopia_recruitment_task/logic/model/message_type.dart';

SnackBar getAppSnackBar({
  required String text,
  required BuildContext context,
  required MessageType messageType,
  String? actionName,
  VoidCallback? onAction,
  Color? actionColor,
  Color? color,
}) {
  return SnackBar(
    content: IntrinsicHeight(
      child: Row(
        children: [
          Center(
              child: Icon(
            messageType.icon,
            color: messageType.color,
          )),
          const SizedBox(width: 10),
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: color ?? Colors.white,
    duration: const Duration(seconds: 3),
    action: actionName == null || onAction == null
        ? null
        : SnackBarAction(
            label: actionName,
            textColor: actionColor ?? darkBlueColor,
            onPressed: onAction,
          ),
  );
}
