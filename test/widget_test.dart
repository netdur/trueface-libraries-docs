import 'package:flutter_test/flutter_test.dart';

import 'package:trueface_libraries_docs/src/docs_manifest.dart';

void main() {
  test('latestVersion is present in docVersions', () {
    expect(docVersions, contains(latestVersion));
  });

  test('titleForPath resolves known paths', () {
    expect(titleForPath('overview'), 'Overview');
    expect(titleForPath('android/setup'), 'Setup');
  });

  test('titleForPath falls back to last segment for unknown paths', () {
    expect(titleForPath('android/SDK'), 'SDK');
  });
}
