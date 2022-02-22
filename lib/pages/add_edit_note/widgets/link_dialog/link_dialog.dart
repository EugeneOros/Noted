import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_recruitment_task/config/colors.dart';
import 'package:utopia_recruitment_task/logic/blocs/note_link/link_bloc.dart';
import 'package:utopia_recruitment_task/widgets/app_text_form_field.dart';
import 'package:utopia_recruitment_task/widgets/buttons/fill_button.dart';

import 'header_icon.dart';

class LinkDialog extends StatefulWidget {
  const LinkDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => LinkDialogState();
}

class LinkDialogState extends State<LinkDialog> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late final TextEditingController textEditingController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    String? link = BlocProvider.of<LinkBloc>(context).state;
    textEditingController.text = link ?? '';
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(30),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 50),
                  AppTextFormField(
                    fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                    labelText: 'Url',
                    controller: textEditingController,
                  ),
                  SizedBox(height: 20),
                  Row(children: [
                    Expanded(
                      child: FillButton(
                        title: "Cancel",
                        color: pinkColor,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: FillButton(
                        title: "Confirm",
                        onPressed: () {
                          BlocProvider.of<LinkBloc>(context).add(LinkUpdated(link: textEditingController.text));
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ])
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: const HeaderIcon(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
