import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:utopia_recruitment_task/logic/blocs/note_link/link_bloc.dart';
import 'package:utopia_recruitment_task/logic/model/message_type.dart';
import 'package:utopia_recruitment_task/widgets/app_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

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

    return Container(
      child: BlocBuilder<LinkBloc, String?>(
        builder: (context, link) {
          if (link != null) {
            return GestureDetector(
              onTap: () => _launchUrl(link),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.link,
                    size: 15,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      link,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
