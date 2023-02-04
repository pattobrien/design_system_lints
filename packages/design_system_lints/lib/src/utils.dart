import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:sidecar/type_checker.dart';

bool? hasDesignSystemAnnotation(Element? element) {
  if (element == null) return null;
  return element.thisOrAncestorMatching((p0) {
        return p0.metadata.any((m) => designSystem.isAssignableFrom(m.element));
      }) !=
      null;
}

bool hasMemberAnnotation(Element? element) {
  if (element == null) return false;
  return element.metadata
      .any((m) => designSystemMember.isAssignableFrom(m.element));
}

bool? isDesignSystemExpression(Expression? exp) {
  if (exp is Literal) return false;
  if (exp is ConditionalExpression) {
    return isDesignSystemExpression(exp.elseExpression);
  }
  if (exp is Identifier) {
    final fieldElement = exp.staticElement?.nonSynthetic;
    if (fieldElement is FieldElement) {
      if (!fieldElement.hasInitializer) {
        return null;
      }
    }
    if (hasDesignSystemAnnotation(exp.staticElement?.nonSynthetic) == false) {
      return false;
    }
  }
  if (exp is PropertyAccess) {
    // TODO: when this is true, we dont return true... therefore, for Enum marked with
    // @designSystem, we get the wrong lint response
    if (hasDesignSystemAnnotation(exp.propertyName.staticElement) == false) {
      return false;
    }
  }

  if (exp is NamedExpression) {
    return isDesignSystemExpression(exp.expression);
  }

  if (exp is InstanceCreationExpression) {
    return false;
  }

  return null;
}

Iterable<Expression> nonDesignSystemExpressions(CollectionElement? exp) sync* {
  if (exp is ListLiteral) {
    final arguments = exp.elements;
    for (final listItem in arguments) {
      yield* nonDesignSystemExpressions(listItem);
    }
  } else if (exp is Literal) {
    yield exp;
  }
  if (exp is ConditionalExpression) {
    yield* nonDesignSystemExpressions(exp.thenExpression);
    yield* nonDesignSystemExpressions(exp.elseExpression);
  }
  if (exp is BinaryExpression) {
    yield* nonDesignSystemExpressions(exp.leftOperand);
    yield* nonDesignSystemExpressions(exp.rightOperand);
  }
  if (exp is AssignmentExpression) {
    exp.writeElement;
  }
  if (exp is Identifier) {
    final staticElement = exp.staticElement?.nonSynthetic;
    if (staticElement is PropertyInducingElement) {
      if (hasAnnotatedProperty(staticElement)) yield exp;
    }
  }
  if (exp is MethodInvocation) {
    if (hasAnnotatedProperty(exp.methodName.staticElement)) yield exp;
  }
  if (exp is PropertyAccess) {
    final staticElement = exp.propertyName.staticElement?.nonSynthetic;
    if (hasAnnotatedProperty(staticElement)) yield exp;
  }

  if (exp is NamedExpression) {
    yield* nonDesignSystemExpressions(exp.expression);
  }

  if (exp is InstanceCreationExpression) {
    yield exp;
  }
}

bool hasAnnotatedProperty(Element? staticElement) {
  if (staticElement is PropertyInducingElement) {
    if (staticElement.hasInitializer) {
      if (hasDesignSystemAnnotation(staticElement) == false) {
        return true;
      }
    }
  } else if (staticElement is PropertyAccessorElement) {
    if (staticElement.variable.hasInitializer) {
      if (hasDesignSystemAnnotation(staticElement) == false) {
        return true;
      }
    }
  } else {
    if (hasDesignSystemAnnotation(staticElement) == false) {
      return true;
    }
  }
  return false;
}

bool isAncestorDesignSystem(AstNode? node) {
  if (node == null) return false;
  return node.thisOrAncestorMatching((p0) {
        if (p0 is Declaration) {
          if (hasDesignSystemAnnotation(p0.declaredElement) ?? false) {
            return true;
          }
        }
        return false;
      }) !=
      null;
}

const designSystemMember = TypeChecker.fromPackage(
  'designSystemMember',
  package: 'design_system_annotations',
);

const designSystem = TypeChecker.fromPackage(
  'designSystem',
  package: 'design_system_annotations',
);

bool isListOfType(TypeChecker checker, DartType? type) {
  if (listType.isNotAssignableFromType(type)) return false;
  if (type is! InterfaceType) return false;
  if (type.typeArguments.length != 1) return false;
  final typeArgument = type.typeArguments.first;
  if (checker.isNotAssignableFromType(typeArgument)) return false;
  return true;
}

const listType = TypeChecker.fromDart('List', package: 'core');
