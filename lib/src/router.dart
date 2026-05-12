import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'docs_manifest.dart';
import 'screen.dart';

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/$latestVersion/overview',
    redirect: _legacyRedirect,
    routes: [
      GoRoute(
        path: '/',
        redirect: (_, __) => '/$latestVersion/overview',
      ),
      GoRoute(
        path: '/:version/:path(.*)',
        builder: (context, state) {
          final version = state.pathParameters['version']!;
          final path = state.pathParameters['path']!;
          return Screen(version: version, path: _stripMdSuffix(path));
        },
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}

String? _legacyRedirect(BuildContext context, GoRouterState state) {
  if (state.uri.path != '/doc') return null;
  final md = state.uri.queryParameters['md'];
  if (md == null) return null;
  return _legacyMdToPath(md);
}

String _legacyMdToPath(String md) {
  var clean = md.startsWith('/') ? md.substring(1) : md;
  clean = _stripMdSuffix(clean);
  return '/$clean';
}

String _stripMdSuffix(String path) {
  return path.endsWith('.md') ? path.substring(0, path.length - 3) : path;
}

String? translateLegacyHref(String href) {
  if (!href.startsWith('/doc')) return null;
  final uri = Uri.tryParse(href);
  if (uri == null) return null;
  final md = uri.queryParameters['md'];
  if (md == null) return null;
  return _legacyMdToPath(md);
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Not found')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '404',
              style: TextStyle(fontSize: 56, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 8),
            const Text('This page does not exist.'),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => context.go('/$latestVersion/overview'),
              child: const Text('Go to docs'),
            ),
          ],
        ),
      ),
    );
  }
}
