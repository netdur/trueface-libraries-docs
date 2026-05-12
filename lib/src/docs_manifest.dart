class DocPage {
  const DocPage({required this.title, required this.path});
  final String title;
  final String path;
}

class DocSection {
  const DocSection({required this.title, required this.pages});
  final String title;
  final List<DocPage> pages;
}

const List<String> docVersions = [
  'v0.8',
  'v1.1',
  'v1.3',
  'v1.4',
  'v1.5',
  'v1.6',
  'v2.1',
  'v2.4',
  'v3.0',
];

const String latestVersion = 'v3.0';

const List<DocSection> docSections = [
  DocSection(
    title: 'Get Started',
    pages: [
      DocPage(title: 'Overview', path: 'overview'),
      DocPage(title: 'Concepts', path: 'concepts'),
      DocPage(title: 'Samples', path: 'samples'),
      DocPage(title: 'Hardware Requirements', path: 'requirements'),
      DocPage(title: 'Models', path: 'models'),
    ],
  ),
  DocSection(
    title: 'Android',
    pages: [
      DocPage(title: 'Setup', path: 'android/setup'),
      DocPage(title: 'Guide', path: 'android/guide'),
      DocPage(title: 'Reference', path: 'android/reference'),
    ],
  ),
  DocSection(
    title: 'iOS',
    pages: [
      DocPage(title: 'Guide', path: 'ios/guide'),
      DocPage(title: 'Objective-C / Swift', path: 'ios/objc'),
    ],
  ),
];

String titleForPath(String path) {
  for (final section in docSections) {
    for (final page in section.pages) {
      if (page.path == path) return page.title;
    }
  }
  final segments = path.split('/');
  return segments.last;
}
