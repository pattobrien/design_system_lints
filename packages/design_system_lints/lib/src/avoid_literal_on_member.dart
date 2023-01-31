// import 'package:analyzer/dart/ast/ast.dart';
// import 'package:analyzer/dart/element/element.dart';
// import 'package:design_system_lints/src/utils.dart';
// import 'package:sidecar/sidecar.dart';

// import 'constants.dart';

// /// Avoid using hardcoded EdgeInsets.
// class AvoidLiteralOnMember extends LintRule {
//   static const _id = 'avoid_literal_on_member';
//   static const _message = 'Avoid a literal for annotated members.';
//   static const _correction = 'Use values in design system spec instead';

//   @override
//   LintCode get code => const LintCode(_id, package: kPackageId, url: kUrl);

//   @override
//   void initializeVisitor(NodeRegistry registry) {
//     registry.addInstanceCreationExpression(this);
//   }

//   @override
//   void visitInstanceCreationExpression(InstanceCreationExpression node) {
//     for (final argument in node.argumentList.arguments) {
//       final param = argument.staticParameterElement;
//       if (param is! FieldFormalParameterElement) continue;

//       if (hasMemberAnnotation(param) || hasMemberAnnotation(param.field)) {
//         if (isDesignSystemExpression(argument) ?? true) continue;

//         reportLint(argument, message: _message, correction: _correction);
//       }
//     }
//   }
// }
