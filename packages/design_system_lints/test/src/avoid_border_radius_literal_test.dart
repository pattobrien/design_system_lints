import 'package:design_system_lints/design_system_lints.dart';
import 'package:test/test.dart';
import 'package:sidecar/test.dart';

void main() {
  group('avoid_border_radius_literal:', () {
    setUpRules([Radius()]);
    ruleTest('no design system', '''
import 'package:flutter/material.dart';

final myRadius = Radius.circular(10.0);
''', [
      ExpectedText('myRadius'),
    ]);

    ruleTest('design system', '''
import 'package:flutter/material.dart';
import 'package:design_system_annotations/design_system_annotations.dart';

final x = BorderRadius.only(topLeft: MyDesignSystem.radius);

@designSystem
class MyDesignSystem {
  static final radius = Radius.circular(10.0);
}
''', []);
  });
}
