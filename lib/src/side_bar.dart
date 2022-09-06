import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  static String version = 'v1.1';

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  var versions = ['v0.8', 'v1.1', 'v1.3'];

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset('assets/trueface_white.svg',
        color: Colors.white, semanticsLabel: 'Trueface Logo');

    return Drawer(
        child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 42,
                width: 100,
                child: svg,
              ),
              const Padding(padding: EdgeInsets.only(top: 12)),
              const Text('SDK Guides')
            ],
          ),
        ),
        ListTile(
          title:
              Text('Get Started', style: Theme.of(context).textTheme.caption),
        ),
        ListTile(
            title: const Text('Overview'),
            onTap: () => Navigator.pushNamed(
                  context,
                  'doc?md=/${SideBar.version}/overview.md&title=Overview',
                )),
        ListTile(
          title: const Text('Concepts'),
          onTap: () => Navigator.pushNamed(
            context,
            'doc?md=/${SideBar.version}/concepts.md&title=Concepts',
          ),
        ),
        ListTile(
          title: const Text('Samples'),
          onTap: () => Navigator.pushNamed(
            context,
            'doc?md=/${SideBar.version}/samples.md&title=Samples',
          ),
        ),
        ListTile(
          title: const Text('Hardware Requirements'),
          onTap: () => Navigator.pushNamed(
            context,
            'doc?md=/${SideBar.version}/requirements.md&title=Hardware Requirements',
          ),
        ),
        ListTile(
          title: Text('Android', style: Theme.of(context).textTheme.caption),
        ),
        ListTile(
            title: const Text('Setup'),
            onTap: () => Navigator.pushNamed(
                  context,
                  'doc?md=/${SideBar.version}/android/setup.md&title=Setup',
                )),
        ListTile(
            title: const Text('Guide'),
            onTap: () => Navigator.pushNamed(
                  context,
                  'doc?md=/${SideBar.version}/android/guide.md&title=Guide',
                )),
        ListTile(
            title: const Text('Reference'),
            onTap: () => Navigator.pushNamed(
                  context,
                  'doc?md=/${SideBar.version}/android/reference.md&title=Reference',
                )),
        ListTile(
          title: Text('NET C#', style: Theme.of(context).textTheme.caption),
        ),
        ListTile(
          title: const Text('Guide'),
          onTap: () => Navigator.pushNamed(
            context,
            'doc?md=/${SideBar.version}/dotnet/guide.md&title=.Net',
          ),
        ),
        ListTile(
          title: Text('iOS', style: Theme.of(context).textTheme.caption),
        ),
        ListTile(
          title: const Text('Guide'),
          onTap: () => Navigator.pushNamed(
            context,
            'doc?md=/${SideBar.version}/ios/guide.md&title=iOS',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(children: [
            const Text('SDK Version'),
            const Padding(padding: EdgeInsets.only(left: 12.0)),
            DropdownButton(
              isExpanded: false,
              value: SideBar.version,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: versions.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  String? newPath;
                  var path = Uri.base.toString().split('/doc?');
                  if (path.length == 2) {
                    newPath =
                        '/doc?${path[1].toString().replaceFirst(SideBar.version, newValue!)}';
                  }
                  SideBar.version = newValue!;
                  if (newPath != null) {
                    Navigator.pushNamed(
                      context,
                      newPath,
                    );
                  }
                });
              },
            ),
          ]),
        ),
      ],
    ));
  }
}
