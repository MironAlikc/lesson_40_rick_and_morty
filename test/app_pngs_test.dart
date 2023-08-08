import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lesson_40_rick_and_morty/resources/resources.dart';

void main() {
  test('app_pngs assets test', () {
    expect(File(AppPngs.charsNotFound).existsSync(), isTrue);
    expect(File(AppPngs.episodeNotFound).existsSync(), isTrue);
    expect(File(AppPngs.filterNotFound).existsSync(), isTrue);
    expect(File(AppPngs.locationNotFound).existsSync(), isTrue);
    expect(File(AppPngs.nativeSplash).existsSync(), isTrue);
    expect(File(AppPngs.splash).existsSync(), isTrue);
  });
}
