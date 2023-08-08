import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lesson_40_rick_and_morty/resources/resources.dart';

void main() {
  test('app_svgs assets test', () {
    expect(File(AppSvgs.chars).existsSync(), isTrue);
    expect(File(AppSvgs.episode).existsSync(), isTrue);
    expect(File(AppSvgs.filter).existsSync(), isTrue);
    expect(File(AppSvgs.grid).existsSync(), isTrue);
    expect(File(AppSvgs.list).existsSync(), isTrue);
    expect(File(AppSvgs.location).existsSync(), isTrue);
    expect(File(AppSvgs.search).existsSync(), isTrue);
    expect(File(AppSvgs.settings).existsSync(), isTrue);
    expect(File(AppSvgs.theme).existsSync(), isTrue);
  });
}
