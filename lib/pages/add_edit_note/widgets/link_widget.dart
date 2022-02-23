import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:utopia_recruitment_task/logic/blocs/note_link/link_bloc.dart';
import 'package:utopia_recruitment_task/logic/model/message_type.dart';
import 'package:utopia_recruitment_task/widgets/app_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utopia_recruitment_task/widgets/buttons/fill_button.dart';

import 'link_dialog/link_dialog.dart';

class LinkWidget extends StatelessWidget {
  final TextEditingController controller;

  const LinkWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          getAppSnackBar(
            context: context,
            messageType: MessageType.error,
            text: 'Link is not valid',
          ),
        );
      }
    }

    void _onEditLink() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const LinkDialog();
        },
      );
    }

    return Container(
      child: BlocBuilder<LinkBloc, String?>(
        builder: (context, link) {
          if (link != null) {
            return GestureDetector(
              onTap: () => _launchUrl(link),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FontAwesomeIcons.link,
                    size: 15,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      link.replaceAll(' ', '\u00A0'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                  FillButton(
                    onPressed: _onEditLink,
                    leftIcon: FontAwesomeIcons.pen,
                    padding: EdgeInsets.all(10),
                    iconSize: 15,
                    radius: 50,
                    // child: Icon(FontAwesomeIcons.pen, size: 20,),
                  ),
                ],
              ),
            );
          }
          return Container(
            alignment: Alignment.centerLeft,
            child: FillButton(
              leftIcon: FontAwesomeIcons.link,
              iconSize: 15,
              textStyle: Theme.of(context).textTheme.subtitle1,
              padding: EdgeInsets.all(7),
              title: 'Add link',
              onPressed: _onEditLink,
            ),
          );
        },
      ),
    );
  }
}
