import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:design_system_lints/src/utils.dart';
import 'package:sidecar/sidecar.dart';

abstract class GenericDesignRule extends LintRule {
  bool Function(DartType? type) get checker;
  String get message;
  String get correction;

  @override
  void initializeVisitor(NodeRegistry registry) => registry
    ..addArgumentList(this)
    ..addDefaultFormalParameter(this)
    ..addFieldDeclaration(this)
    ..addTopLevelVariableDeclaration(this);

  @override
  void visitTopLevelVariableDeclaration(TopLevelVariableDeclaration node) {
    for (final variable in node.variables.variables) {
      final type = variable.declaredElement?.type;
      if (!checker(type)) continue;
      visitExpression(variable.initializer);
    }
  }

  @override
  void visitFieldDeclaration(FieldDeclaration node) {
    for (final v in node.fields.variables) {
      if (!checker(v.declaredElement?.type)) continue;
      visitExpression(v.initializer);
    }
  }

  @override
  void visitArgumentList(ArgumentList node) {
    for (final argument in node.arguments) {
      if (!checker(argument.staticType)) continue;
      visitExpression(argument);
    }
  }

  @override
  void visitDefaultFormalParameter(DefaultFormalParameter node) {
    if (!checker(node.defaultValue?.staticType)) return;
    visitExpression(node.defaultValue);
  }

  void visitExpression(Expression? node) {
    if (isAncestorDesignSystem(node)) return;
    for (final expression in nonDesignSystemExpressions(node)) {
      reportLint(expression, message: message, correction: correction);
    }
  }
}
