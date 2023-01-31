import 'package:design_system_annotations/design_system_annotations.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Lints will appear over new creations of theme
      theme: ThemeData(
        accentColor: Colors.black,
      ),
    );
  }
}

class DesignApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyCustomTheme.light,
    );
  }
}

@designSystem
class MyCustomTheme {
  static final light = ThemeData(
    primaryColor: primary,
    hoverColor: white,
  );

  static const primary = Colors.blue;
  static const white = Colors.white;
}
