import 'package:design_system_annotations/design_system_annotations.dart';
import 'package:flutter/material.dart';

@designSystem
final abc = Radius.circular(10.0);

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Icon(MyTheme.icon),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: MyTheme.radius,
              topRight: Radius.circular(2.0),
            ),
          ),
        ),
      ],
    );
  }
}

@designSystem
class MyTheme {
  static const radius = Radius.circular(1.0);

  static const icon = Icons.abc;
}

@designSystem
final boxShadow = BoxShadow();
