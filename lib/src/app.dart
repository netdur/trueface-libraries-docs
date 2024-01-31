import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trueface_libraries_docs/src/screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:trueface_libraries_docs/src/side_bar.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool show404 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trueface Docs',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: kIsWeb
              ? {
                  for (final platform in TargetPlatform.values)
                    platform: const NoTransitionsBuilder(),
                }
              : const {},
        ),
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context)
            .textTheme
            .apply(bodyColor: Colors.white, displayColor: Colors.white60)),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(color: Colors.white))),
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      // home: const Screen(md: 'v1.1/overview.md', title: 'Overview'),

      routes: {
        '/': (context) =>
            Screen(md: '${SideBar.version}/overview.md', title: 'Overview'),
      },
      onGenerateRoute: (settings) {
        var uri = Uri.parse(settings.name!);
        if (uri.pathSegments.first == 'doc') {
          String md = uri.queryParameters['md']!;
          String title = uri.queryParameters['title'] ?? '...';
          return MaterialPageRoute(
            settings: RouteSettings(name: '/doc?md=$md&title=$title'),
            builder: (context) => Screen(md: md, title: title),
          );
        }
        return null;
      },
    );
  }
}

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    // only return the child without warping it with animations
    return child!;
  }
}
