import 'package:analyzer/dart/element/type.dart';
import 'package:sidecar/sidecar.dart';
import 'constants.dart';
import 'generic_rule.dart';

/// Avoid hardcoding Color literals.
class Color extends GenericDesignRule {
  static const _id = 'color';
  static const _message = 'Avoid Color literal';
  static const _correction = 'Use design system spec instead.';

  @override
  LintCode get code => const LintCode(_id, package: kPackageId);

  @override
  bool Function(DartType? type) get checker => color.isAssignableFromType;

  @override
  String get correction => _correction;

  @override
  String get message => _message;
}
