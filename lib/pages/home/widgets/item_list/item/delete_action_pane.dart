import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

ActionPane getDeleteActionPane(BuildContext context, Function onDelete) {
  return ActionPane(
    motion: const ScrollMotion(),
    extentRatio: 0.2,
    children: [
      Expanded(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 15),
            child: FloatingActionButton(
              onPressed: () => onDelete(),
              child: Icon(Icons.delete, color: Theme.of(context).colorScheme.onSecondary),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
          ),
        ),
      )
    ],
  );
}
