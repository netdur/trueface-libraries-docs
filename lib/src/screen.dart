import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'docs_manifest.dart';
import 'mdpage.dart';
import 'side_bar.dart';
import 'theme.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.version,
    required this.path,
  });

  final String version;
  final String path;

  String get _assetPath => 'assets/$version/$path.md';
  String get _title => titleForPath(path);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width >= 900;

    if (isWide) {
      return Scaffold(
        body: Row(
          children: [
            SideBar(version: version, currentPath: path),
            const VerticalDivider(width: 1, color: borderSubtle),
            Expanded(
              child: Column(
                children: [
                  _TopBar(title: _title, version: version),
                  Expanded(child: MDPage(assetPath: _assetPath)),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      drawer: SideBar(
        version: version,
        currentPath: path,
        onNavigate: () => Navigator.of(context).maybePop(),
      ),
      body: Column(
        children: [
          _TopBar(title: _title, version: version, showMenu: true),
          Expanded(child: MDPage(assetPath: _assetPath)),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.title,
    required this.version,
    this.showMenu = false,
  });

  final String title;
  final String version;
  final bool showMenu;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: surfaceDark,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: borderSubtle)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            if (showMenu)
              Builder(
                builder: (ctx) => IconButton(
                  icon: const Icon(Icons.menu),
                  color: textPrimary,
                  onPressed: () => Scaffold.of(ctx).openDrawer(),
                ),
              ),
            Flexible(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: surfaceElevated,
                border: Border.all(color: borderSubtle),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                version,
                style: const TextStyle(color: textMuted, fontSize: 12),
              ),
            ),
            const Spacer(),
            const _ExternalLink(label: 'Trueface', url: 'https://trueface.ai'),
            const _ExternalLink(
              label: 'Support',
              url: 'https://support.trueface.ai/support/home',
            ),
          ],
        ),
      ),
    );
  }
}

class _ExternalLink extends StatelessWidget {
  const _ExternalLink({required this.label, required this.url});

  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => launchUrl(Uri.parse(url)),
      style: TextButton.styleFrom(foregroundColor: textPrimary),
      child: Text(label),
    );
  }
}
