import 'package:example/exports/dimensions.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.0000),
      margin: EdgeInsets.only(
        top: 1.0,
        bottom: AppDimensions.token1,
      ),
      child: Container(
        margin: X.abc,
      ),
    );
  }
}

class X {
  static const abc = EdgeInsets.all(1.0);
}
