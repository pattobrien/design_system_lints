// // import 'package:design_system_annotations/design_system_annotations.dart';
// import 'package:design_system_annotations/design_system_annotations.dart';
// import 'package:flutter/material.dart';

// // final large = 12.0;

// // @designSystem
// // final myTopLevelColor = Color(0x000);

// // class MyWidget extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       // appears for hardcoded integer or double values
// //       padding: EdgeInsets.only(left: 12.0), // lint: avoid_edge_insets_literal

// //       // also appears when using variables that are declared
// //       // outside of a design system
// //       margin: EdgeInsets.all(large), // lint: avoid_edge_insets_literal
// //     );
// //   }
// // }

// // @designSystem
// // class CustomColors {
// //   static const mycolor = Color(0x000);
// // }

// // @designSystem
// // class CustomColors2 {
// //   static const mycolor = Color(0x000);
// // }

// // // @designSystem
// // class DesignSystem {
// //   static const small = 2.0;
// //   static const medium = 4.0;
// //   static const large = 8.0;
// //   static const xlarge = 16.0;

// //   static const designRed = Colors.red;
// //   static const myColor = CustomColors.mycolor;
// //   static const myColor2 = CustomColors2.mycolor;
// // }

// // @designSystem
// // class MyTheme {
// //   static final red = Colors.red;

// //   static final light = ThemeData(
// //     primaryColor: Color(0x00000),
// //   );
// // }

// class ThemedWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Theme.of(context).backgroundColor);
//   }
// }

// class MyWidget extends StatelessWidget {
//   // MyWidget(this.color);

//   // @designSystem
//   // final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: EdgeInsets.all(DesignSystem.large), // no lint
//       // color: DesignSystem.designRed,
//       // child: Text(
//       //   '',
//       //   style: Theme.of(context).textTheme.headline1,
//       // ),
//       color: Theme.of(context).backgroundColor,
//       // MethodDeclaration, DeclaredSimpleIdentifier (build),
//       // ...
//       // ArgumentList ((color: Theme.of(context)..)),
//       // NamedExpression (color: ...)
//       // PropertyAccess (Theme.of(context).backgroundColor)
//       // MethodInvocation (Theme.of(context)), SimpleIdent (Theme),
//       // SimpleIdent (of), ..., SimpleIdent (backgroundColor)
//     );
//   }
// }

// // // final classInstance = MyClass(color: Color(0x000));
// // // TopLevelVariable, VariableDeclarationList, VariableDeclaration, DeclaredSimpleIdentifier,
// // // InstanceCreationExp (MyClass(...)), ConstructorName (MyClass), NamedType (MyClass),
// // // SimpleIdentifier (MyClass)
// // // ArgumentList (color: Color(0x000)), NamedExpression (color: Color(0x000)),
// // // InstanceCreationExp (Color(0x000)),
// // // ConstructorName (Color), NamedType (Color),
// // // SimpleIdentifier (Color), ArgumentList (0x000), IntegerLiteral,

// // // NOTE: ArgumentList was either a NamedExpression>InstanceCreation
// // // or went right to InstanceCreation

// // class MyClassDto {
// //   MyClass toDomain() => MyClass(
// //         // color: Color(colorValue),
// //         color: MyColors.blue,
// //       );
// //   // FormalParameterList,
// //   // InstanceCreationExp (MyClass(color: ...)),
// //   // ConstructorName, NamedType, SimpleIdentifier,
// //   // ArgumentList ((color: Color(colorValue))),
// //   // NamedExpression (color: Color(colorvalue)),
// //   // Label,
// //   MyClassDto(this.colorValue);

// //   final int colorValue;

// //   factory MyClassDto.fromDomain(MyClass myClass) =>
// //       MyClassDto(myClass.color.value);
// // }

// // class MyClass {
// //   const MyClass({
// //     required this.color,
// //   });

// //   // @designSystem
// //   final Color color;
// // }

// // @designSystem
// // class MyColors {
// //   static const blue = Colors.blue;
// // }

// // class MyColorWidget extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(color: MyColors.blue);
// //   }
// // }

// // class CustomWidget extends StatelessWidget {
// //   const CustomWidget({required this.myColor});

// //   final Color myColor;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(color: myColor);
// //   }
// // }
// // // ??, DeclaredSimpleIdentifier (CustomWidget), ExtendsClause,
// // // NamedType (StatelessWidget), SimpleIdentifier (StatelessW),
// // // ConstructorDeclaration (const CustomWidget({required...})),
// // // SimpleIdentifier, FormalParameterList, DefaultFormalParameter,
// // // FieldFormalParam, DeclaredSimpleIdent (myColor), EmptyFunctionBody (;),
// // //
// // // FieldDeclaration (final Color myColor), VariableDeclarationList,
// // // NamedType (Color), SimpleIdentifier, VariableDeclaration (myColor),
// // // DeclaredSimpleIdentifier (myColor),
// // //
// // // MethodDeclaration (build method), ....
// // //...
// // // InstanceCreationExp (Container(...)),

// // class UserProfile {
// //   const UserProfile(this.name, {this.favoriteColor = Colors.blue});
// //   final String name;
// //   final Color favoriteColor;
// // }

// // class CustomWidget extends StatelessWidget {
// //   const CustomWidget({this.myColor = Colors.red});

// //   final Color myColor;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(color: myColor);
// //   }
// // }

// // class CustomWidget extends StatelessWidget {
// //   const CustomWidget({Color? color}) : myColor = color ?? const Color(0x000);

// //   final Color myColor;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(color: myColor);
// //   }
// // }

// // ConstructorFieldInitializer (myColor = color ?? const Color(0x000))
// // SimplIde (myColor), BinaryExp (color ?? const Color(0x000)),
// // SimpleIdent (color), InstanceCreationExp (const Color(0x000)),

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       theme: ThemeData(
// //         primaryColor: MyColors.blue,
// //         secondaryHeaderColor: Colors.red,
// //         scaffoldBackgroundColor: myTopLevelColor,
// //       ),
// //     );
// //   }
// // }

// // class ConditionalWidget extends StatelessWidget {
// //   const ConditionalWidget({
// //     required this.myColor,
// //     this.isValue = true,
// //   });

// //   final Color myColor;
// //   final bool isValue;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(color: isValue ? myColor : myTopLevelColor);
// //   }
// // }
