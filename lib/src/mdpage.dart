import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';

import 'router.dart';
import 'theme.dart';

class MDPage extends StatefulWidget {
  const MDPage({
    super.key,
    required this.assetPath,
  });

  final String assetPath;

  @override
  State<MDPage> createState() => _MDPageState();
}

class _MDPageState extends State<MDPage> {
  late Future<String> _content;

  @override
  void initState() {
    super.initState();
    _content = _load();
  }

  @override
  void didUpdateWidget(covariant MDPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetPath != widget.assetPath) {
      setState(() {
        _content = _load();
      });
    }
  }

  Future<String> _load() => rootBundle.loadString(widget.assetPath);

  void _onLinkTap(String href) {
    final legacy = translateLegacyHref(href);
    if (legacy != null) {
      context.go(legacy);
      return;
    }
    if (href.startsWith('/')) {
      context.go(href);
      return;
    }
    final uri = Uri.tryParse(href);
    if (uri != null) launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _content,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return _LoadError(path: widget.assetPath);
        }
        return _MarkdownView(
          data: snapshot.data!,
          assetBaseDir: _assetBaseDir,
          onLinkTap: _onLinkTap,
        );
      },
    );
  }

  String get _assetBaseDir {
    final i = widget.assetPath.lastIndexOf('/');
    return i < 0 ? '' : widget.assetPath.substring(0, i);
  }
}

class _MarkdownView extends StatelessWidget {
  const _MarkdownView({
    required this.data,
    required this.assetBaseDir,
    required this.onLinkTap,
  });

  final String data;
  final String assetBaseDir;
  final ValueChanged<String> onLinkTap;

  String _resolveImageSrc(String src) {
    if (src.startsWith('http://') || src.startsWith('https://')) return src;
    if (src.startsWith('assets/')) return src;
    if (src.startsWith('/')) return 'assets$src';
    return assetBaseDir.isEmpty ? src : '$assetBaseDir/$src';
  }

  @override
  Widget build(BuildContext context) {
    final mono = GoogleFonts.jetBrainsMono(fontSize: 13.5, height: 1.55);
    final body = GoogleFonts.inter(
      fontSize: 16,
      height: 1.7,
      color: textPrimary,
    );

    final config = MarkdownConfig(configs: [
      PConfig(textStyle: body),
      H1Config(
        style: GoogleFonts.inter(
          fontSize: 32,
          height: 1.25,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      H2Config(
        style: GoogleFonts.inter(
          fontSize: 24,
          height: 1.3,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      H3Config(
        style: GoogleFonts.inter(
          fontSize: 19,
          height: 1.4,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      H4Config(
        style: GoogleFonts.inter(
          fontSize: 16,
          height: 1.4,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      H5Config(
        style: GoogleFonts.inter(
          fontSize: 14,
          height: 1.45,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFE6E8EB),
        ),
      ),
      H6Config(
        style: GoogleFonts.inter(
          fontSize: 13,
          height: 1.5,
          fontWeight: FontWeight.w600,
          color: textMuted,
        ),
      ),
      LinkConfig(
        style: TextStyle(
          color: linkColor,
          decoration: TextDecoration.underline,
          decorationColor: linkColor.withValues(alpha: 0.4),
        ),
        onTap: onLinkTap,
      ),
      ImgConfig(
        builder: (src, attrs) {
          final resolved = _resolveImageSrc(src);
          final isNetwork = resolved.startsWith('http');
          final image = isNetwork
              ? Image.network(resolved, fit: BoxFit.contain)
              : Image.asset(resolved, fit: BoxFit.contain);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: borderSubtle),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: image,
              ),
            ),
          );
        },
      ),
      CodeConfig(
        style: mono.copyWith(
          backgroundColor: inlineCodeBackground,
          color: const Color(0xFFE6E8EB),
        ),
      ),
      PreConfig(
        textStyle: mono,
        theme: atomOneDarkTheme,
        decoration: BoxDecoration(
          color: codeBackground,
          border: Border.all(color: borderSubtle),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        wrapper: (child, code, language) => _CodeBlock(
          code: code,
          language: language,
          child: child,
        ),
      ),
      const BlockquoteConfig(
        sideColor: brandBlue,
        sideWith: 3,
        textColor: textPrimary,
      ),
      const HrConfig(height: 1, color: borderSubtle),
      TableConfig(
        border: TableBorder.all(color: borderSubtle, width: 1),
        headerStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodyStyle: GoogleFonts.inter(
          fontSize: 14,
          color: textPrimary,
        ),
        headerRowDecoration: const BoxDecoration(color: surfaceElevated),
      ),
    ]);

    return SelectionArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: maxContentWidth),
            child: MarkdownBlock(
              data: data,
              config: config,
            ),
          ),
        ),
      ),
    );
  }
}

class _CodeBlock extends StatefulWidget {
  const _CodeBlock({
    required this.code,
    required this.language,
    required this.child,
  });

  final String code;
  final String language;
  final Widget child;

  @override
  State<_CodeBlock> createState() => _CodeBlockState();
}

class _CodeBlockState extends State<_CodeBlock> {
  bool _justCopied = false;

  static const Set<String> _supportedLanguages = {
    'bash', 'shell', 'sh', 'zsh',
    'c', 'cpp', 'cs', 'csharp',
    'dart', 'go', 'gradle', 'groovy',
    'html', 'xml', 'json', 'yaml',
    'java', 'kotlin',
    'javascript', 'js', 'typescript', 'ts',
    'objectivec', 'objc',
    'python', 'rust',
    'swift', 'ruby',
    'plaintext',
  };

  String _normalizeLanguage(String lang) {
    final l = lang.toLowerCase().trim();
    if (l.isEmpty) return 'plaintext';
    const aliases = {
      'clike': 'c',
      'objective-c': 'objectivec',
      'obj-c': 'objectivec',
      'sh': 'bash',
      'shell': 'bash',
      'zsh': 'bash',
    };
    final mapped = aliases[l] ?? l;
    return _supportedLanguages.contains(mapped) ? mapped : 'plaintext';
  }

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.code));
    if (!mounted) return;
    setState(() => _justCopied = true);
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (mounted) setState(() => _justCopied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = _normalizeLanguage(widget.language);
    final mono = GoogleFonts.jetBrainsMono(fontSize: 13.5, height: 1.55);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: codeBackground,
            border: Border.all(color: borderSubtle),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(14, 8, 6, 8),
                decoration: const BoxDecoration(
                  color: surfaceElevated,
                  border: Border(
                    bottom: BorderSide(color: borderSubtle),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      lang == 'plaintext' ? 'code' : lang,
                      style: const TextStyle(
                        color: textMuted,
                        fontSize: 11,
                        letterSpacing: 0.6,
                      ),
                    ),
                    const Spacer(),
                    _CopyButton(copied: _justCopied, onPressed: _copy),
                  ],
                ),
              ),
              Scrollbar(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                  child: HighlightView(
                    widget.code,
                    language: lang,
                    theme: atomOneDarkTheme,
                    textStyle: mono,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CopyButton extends StatelessWidget {
  const _CopyButton({required this.copied, required this.onPressed});

  final bool copied;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: copied ? const Color(0xFF34D399) : textMuted,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: const TextStyle(fontSize: 12),
      ),
      icon: Icon(
        copied ? Icons.check : Icons.content_copy_outlined,
        size: 14,
      ),
      label: Text(copied ? 'Copied' : 'Copy'),
    );
  }
}

class _LoadError extends StatelessWidget {
  const _LoadError({required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.description_outlined, size: 48, color: textMuted),
            const SizedBox(height: 12),
            const Text(
              'This page is not available for this version.',
              style: TextStyle(color: textPrimary, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              path,
              style: const TextStyle(color: textMuted, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
