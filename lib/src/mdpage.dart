import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';
import 'link_button.dart';

class MDPage extends StatefulWidget {
  MDPage(
      {Key? key,
      required this.md,
      required this.title,
      required this.showMenu,
      this.onMenuTap})
      : super(key: key) {
    //
  }

  final String md;
  final String title;
  final bool showMenu;
  final VoidCallback? onMenuTap;

  @override
  State<MDPage> createState() => _MDPageState();
}

class _MDPageState extends State<MDPage> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();

    return Scaffold(
      primary: true,
      appBar: AppBar(
        leading: (widget.showMenu == true)
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: widget.onMenuTap ?? () {},
              )
            : null,
        title: Text(widget.title),
        actions: const [
          // LinkButton(text: 'Pangiam', link: 'https://www.pangiam.com'),
          LinkButton(text: 'Trueface', link: 'https://trueface.ai'),
          LinkButton(
              text: 'Support',
              link: 'https://support.trueface.ai/support/home'),
          LinkButton(
              text: 'Forum', link: 'https://support.trueface.ai/support/home'),
        ],
      ),
      body: SingleChildScrollView(
          controller: controller,
          child: FutureBuilder(
              future: rootBundle.loadString('assets/${widget.md}'),
              // future: rootBundle.loadString('${widget.md}'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  ThemeData theme = Theme.of(context);
                  return Padding(
                      padding: const EdgeInsets.all(24),
                      child: MarkdownBody(
                          styleSheet: MarkdownStyleSheet.fromTheme(theme)
                              .copyWith(
                                  codeblockPadding: const EdgeInsets.all(12),
                                  code: GoogleFonts.ubuntuMono(fontSize: 14.0),
                                  h2Padding: const EdgeInsets.only(top: 12),
                                  pPadding: const EdgeInsets.only(top: 12),
                                  p: theme.textTheme.bodyLarge
                                      ?.copyWith(fontSize: 14.0)),
                          extensionSet: md.ExtensionSet(
                            [
                              const md.FencedCodeBlockSyntax(),
                              ...md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                            ],
                            [
                              md.EmojiSyntax(),
                              ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
                            ],
                          ),
                          selectable: true,
                          onTapLink:
                              (String text, String? href, String title) async {
                            if (href != null) {
                              if (href.startsWith('/')) {
                                Navigator.pushNamed(
                                  context,
                                  href,
                                );
                              } else {
                                _launchUrl(href);
                              }
                            }
                          },
                          data: snapshot.data.toString()));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
