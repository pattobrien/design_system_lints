import 'package:design_system_lints/design_system_lints.dart';
import 'package:sidecar/test.dart';
import 'package:test/test.dart';

void main() {
  group('avoid_edge_insets_literal:', () {
    setUpRules([EdgeInsets()]);

    ruleTest('EdgeInsets.all', content3, [ExpectedText('2.0')]);

    ruleTest('EdgeInsets.only', content4, [
      ExpectedText('1.1'),
      ExpectedText('1.2'),
      ExpectedText('1.3'),
      ExpectedText('1.4'),
    ]);

    ruleTest('EdgeInsets.symmetric', content5, [
      ExpectedText('2.1'),
      ExpectedText('2.2'),
    ]);

    ruleTest('EdgeInsets.all with variable', '''
import 'package:flutter/material.dart';

final value = 1.0;

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(value),
    );
  }
}
''', [ExpectedText('value')]);

    ruleTest(
        'EdgeInsets.only with variable', content7, [ExpectedText('value2')]);

    ruleTest('EdgeInsets using Design System', content8, []);
  });
}

const content3 = '''
import 'package:flutter/material.dart';
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
    );
  }
}
''';

const content4 = '''
import 'package:flutter/material.dart';
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 1.1, right: 1.2, top: 1.3, bottom: 1.4),
    );
  }
}
''';

const content5 = '''
import 'package:flutter/material.dart';
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.1, vertical: 2.2),
    );
  }
}
''';

const content7 = '''
import 'package:flutter/material.dart';
final value2 = 1.0;
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: value2),
    );
  }
}
''';

const content8 = '''
import 'package:design_system_annotations/design_system_annotations.dart';
import 'package:flutter/material.dart';

@designSystem
class DesignSystemX {
  static const value = 3.1;
}

final edgeInsets = EdgeInsets.all(DesignSystemX.value);
''';
