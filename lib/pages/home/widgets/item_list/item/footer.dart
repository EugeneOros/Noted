import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:utopia_recruitment_task/config/colors.dart';

class ItemFooter extends StatelessWidget {
  final DateTime createdDate;

  const ItemFooter({Key? key, required this.createdDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        Text(
          Jiffy(createdDate).yMMMMd,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(color: greyColor),
        ),
        const Spacer(),
        Icon(
          Icons.arrow_forward_ios,
          color: Theme.of(context).colorScheme.primary,
          size: 20,
        )
      ],
    );
  }
}
