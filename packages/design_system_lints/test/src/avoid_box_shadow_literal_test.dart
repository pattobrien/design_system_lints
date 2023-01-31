import 'package:design_system_lints/design_system_lints.dart';
import 'package:sidecar/test.dart';
import 'package:test/test.dart';

void main() {
  group('avoid_box_shadow_literal:', () {
    setUpRules([BoxShadow()]);

    ruleTest('top level variables', '''
import 'package:flutter/material.dart';

final myShadow = BoxShadow();
''', [
      ExpectedText('BoxShadow()'),
    ]);

    ruleTest('no design system', '''
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow()],
      ),
    );
  }
}
''', [
      ExpectedText('BoxShadow()'),
    ]);
  });
}
