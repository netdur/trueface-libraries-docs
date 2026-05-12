import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'docs_manifest.dart';
import 'theme.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
    required this.version,
    required this.currentPath,
    this.onNavigate,
  });

  final String version;
  final String currentPath;
  final VoidCallback? onNavigate;

  void _go(BuildContext context, String path) {
    onNavigate?.call();
    context.go('/$version/$path');
  }

  void _switchVersion(BuildContext context, String newVersion) {
    onNavigate?.call();
    context.go('/$newVersion/$currentPath');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: surfaceElevated,
      child: SizedBox(
        width: sidebarWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Header(
              version: version,
              onVersionChanged: (v) => _switchVersion(context, v),
            ),
            const Divider(height: 1, color: borderSubtle),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 12),
                children: [
                  for (final section in docSections) ...[
                    _SectionLabel(section.title),
                    for (final page in section.pages)
                      _NavTile(
                        title: page.title,
                        selected: page.path == currentPath,
                        onTap: () => _go(context, page.path),
                      ),
                    const SizedBox(height: 8),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.version, required this.onVersionChanged});

  final String version;
  final ValueChanged<String> onVersionChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 28,
            child: SvgPicture.asset(
              'assets/trueface_white.svg',
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              alignment: Alignment.centerLeft,
              fit: BoxFit.contain,
              semanticsLabel: 'Trueface logo',
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'SDK Documentation',
            style: TextStyle(color: textMuted, fontSize: 12, letterSpacing: 0.4),
          ),
          const SizedBox(height: 12),
          _VersionPicker(value: version, onChanged: onVersionChanged),
        ],
      ),
    );
  }
}

class _VersionPicker extends StatelessWidget {
  const _VersionPicker({required this.value, required this.onChanged});

  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: surfaceDark,
        border: Border.all(color: borderSubtle),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: docVersions.contains(value) ? value : latestVersion,
          isDense: true,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: textMuted),
          dropdownColor: surfaceElevated,
          style: const TextStyle(color: textPrimary, fontSize: 14),
          items: [
            for (final v in docVersions.reversed)
              DropdownMenuItem(
                value: v,
                child: Text(v == latestVersion ? '$v  (latest)' : v),
              ),
          ],
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 6),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: textMuted,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: selected ? brandBlue : Colors.transparent,
              width: 3,
            ),
          ),
          color: selected ? brandBlue.withValues(alpha: 0.08) : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : textPrimary,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
