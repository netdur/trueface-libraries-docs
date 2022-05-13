import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  const LinkButton(
      {required this.text,
      required this.link,
      Color? color = Colors.white,
      Key? key})
      : super(key: key);

  final String text;
  final String link;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text, style: const TextStyle(color: Colors.white)),
      onPressed: () async {
        if (!await launchUrl(Uri.parse(link))) throw 'Could not launch $link';
      },
    );
  }
}
