import 'package:analyzer/dart/ast/ast.dart';
import 'package:design_system_lints/src/utils.dart';
import 'package:sidecar/sidecar.dart';

import 'constants.dart';

/// Avoid using hardcoded EdgeInsets.
class EdgeInsets extends LintRule {
  static const _id = 'edge_insets';
  static const _message = 'Avoid hardcoded EdgeInsets values';
  static const _correction = 'Use values in design system spec instead';

  @override
  LintCode get code => const LintCode(_id, package: kPackageId, url: kUrl);

  @override
  void initializeVisitor(NodeRegistry registry) {
    registry.addInstanceCreationExpression(this);
  }

  @override
  void visitInstanceCreationExpression(InstanceCreationExpression node) {
    final returnType = node.constructorName.staticElement?.returnType;

    if (!edgeInsets.isAssignableFromType(returnType)) return;

    for (final arg in node.argumentList.arguments) {
      if (arg is Literal) {
        reportLint(arg, message: _message, correction: _correction);
        continue;
      }

      if (isDesignSystemExpression(arg) ?? true) continue;

      if (arg is NamedExpression) {
        reportLint(arg.expression, message: _message, correction: _correction);
      } else {
        reportLint(arg, message: _message, correction: _correction);
      }
    }
  }
}
