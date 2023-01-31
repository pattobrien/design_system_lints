import 'package:design_system_lints/design_system_lints.dart';
import 'package:sidecar/test.dart';
import 'package:test/test.dart';

void main() {
  group('avoid_color_literal', () {
    setUpRules([Color()]);

    ruleTest('widget uses design system color', '''
import 'package:design_system_annotations/design_system_annotations.dart';
import 'package:flutter/material.dart';

@designSystem
class MyColors {
  static const blue = Colors.blue;
}

class MyColorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: MyColors.blue);
  }
}
''', []);

    ruleTest('widget does not use design system color', '''
import 'package:flutter/material.dart';

class MyColors {
  static const myBlue = Colors.blue;
}

class MyColorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: MyColors.myBlue);
  }
}
''', [ExpectedText('Colors.blue'), ExpectedText('MyColors.myBlue')]);

    // The field 'myColor' should be protected by default
    // and a lint should appear if we attempt to assign
    // a non-design system color to it.
    // Otherwise, no internal lint should appear
    ruleTest('custom widget with Color field', '''
import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({required this.myColor});

  final Color myColor;

  @override
    Widget build(BuildContext context) {
      return Container(color: myColor);
    }
}
''', []);

    // since UserProfile is not marked as a designSystem
    // entity, then we should lint any color objects that are
    // assigned to it.
    // Otherwise, there should be no internal lints that appear,
    // because the model itself is not creating or assigning any colors

    ruleTest('custom class', '''
import 'package:flutter/material.dart';

class UserProfile {
  const UserProfile(this.name, this.favoriteColor);
  final String name;
  final Color favoriteColor;
}
''', []);

    // same as above test, but now we're trying to create an object of MyClass
    // with a new Color object
    ruleTest('custom class instance creation', '''
import 'package:flutter/material.dart';

class UserProfile {
  const UserProfile(this.name, this.favoriteColor);
  final String name;
  final Color favoriteColor;
}

final classInstance = MyClass(Color(0x000));
''', [ExpectedText('Color(0x000)')]);

    // using a default value in the constructor should trigger a lint
    // as its not a design system value
    ruleTest('default param from material colors', '''
import 'package:flutter/material.dart';

class UserProfile {
  const UserProfile(this.name, {this.favoriteColor = const Color(0x000)});
  final String name;
  final Color favoriteColor;
}
''', [ExpectedText('const Color(0x000)')]);

    ruleTest('theme data using desing system and non design system', '''
import 'package:design_system_annotations/design_system_annotations.dart';
import 'package:flutter/material.dart';

@designSystem
class MyColors {
  static const blue = Colors.blue;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: MyColors.blue,
        secondaryHeaderColor: Colors.red,
      ),
    );
  }
}
''', [ExpectedText('Colors.red')]);

    ruleTest('conditional expression', '''
import 'package:flutter/material.dart';

class ConditionalWidget extends StatelessWidget {
  const ConditionalWidget({
    required this.myColor,
    this.isValue = true,
  });

  final Color myColor;
  final bool isValue;

  @override
  Widget build(BuildContext context) {
    return Container(color: isValue ? myColor : Color(0x000));
  }
}
''', [ExpectedText('Color(0x000)')]);

    ruleTest('designSystem annotation', '''
import 'package:design_system_annotations/design_system_annotations.dart';
import 'package:flutter/material.dart';

@designSystem
class MyTheme {
  static final light = ThemeData(
    primaryColor: Color(0x00000),
  );
}
''', []);

    ruleTest('Colors from material', '''
import 'package:flutter/material.dart';

class MyTheme {
  static final red = Colors.red;
}
''', [ExpectedText('Colors.red')]);

    ruleTest('Theme property invocation', '''
import 'package:flutter/material.dart';

class ThemedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Theme.of(context).backgroundColor);
  }
}
''', []);
    ruleTest('Theme property invocation', '''
import 'package:design_system_annotations/design_system_annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: ref.watch(someProvider).color,
    );
  }
}

final someProvider = Provider((ref) => MyTextTheme());

@designSystem
class MyTextTheme {
  final color = Color(0x000);
}

''', []);

    // tests todo:
    // - DTO that creates UserProfile to/from json
  });
}
