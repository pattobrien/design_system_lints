import 'package:design_system_annotations/design_system_annotations.dart';
import 'package:flutter/material.dart';

@designSystem
class AppShadows {
  static const token1 = BoxShadow(
    color: Color(0xff000000),
    offset: Offset(2, 2),
    blurRadius: 0,
    spreadRadius: 0,
  );

  AppShadows._();
}
