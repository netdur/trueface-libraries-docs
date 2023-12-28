import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:trueface_libraries_docs/src/mdpage.dart';
import 'package:trueface_libraries_docs/src/side_bar.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key, required this.md, required this.title})
      : super(key: key);

  final String md;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        breakpoints:
            const ScreenBreakpoints(desktop: 900, tablet: 650, watch: 250),
        mobile: (BuildContext context) => OrientationLayoutBuilder(
            portrait: (context) => ScreenMobilePortrait(md: md, title: title),
            landscape: (context) =>
                ScreenMobileLandscape(md: md, title: title)),
        tablet: (BuildContext context) =>
            ScreenViewTablet(md: md, title: title));
  }
}

class ScreenViewTablet extends StatelessWidget {
  const ScreenViewTablet({Key? key, required this.md, required this.title})
      : super(key: key);

  final String md;
  final String title;

  @override
  Widget build(BuildContext context) {
    var children = [
      Expanded(
        child: MDPage(md: md, title: title, showMenu: false),
      ),
      const SideBar()
    ];
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: orientation == Orientation.portrait
          ? Column(children: children)
          : Row(children: children.reversed.toList()),
    );
  }
}

class ScreenMobilePortrait extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String md;
  final String title;

  ScreenMobilePortrait({Key? key, required this.md, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideBar(),
      body: MDPage(
          md: md,
          title: title,
          showMenu: true,
          onMenuTap: () {
            _scaffoldKey.currentState!.openDrawer();
          }),
    );
  }
}

class ScreenMobileLandscape extends StatelessWidget {
  final String md;
  final String title;
  const ScreenMobileLandscape({Key? key, required this.md, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[SideBar()],
      ),
    );
  }
}
