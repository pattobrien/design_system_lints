import 'package:analyzer/dart/element/type.dart';
import 'package:sidecar/sidecar.dart';

import 'constants.dart';
import 'generic_rule.dart';

/// Avoid hardcoding Radius.
class Radius extends GenericDesignRule {
  static const _id = 'radius';
  static const _message = 'Avoid hardcoded Radius values';
  static const _correction = 'Use values in design system spec instead';

  @override
  LintCode get code => const LintCode(_id, package: kPackageId, url: kUrl);

  @override
  String get correction => _correction;

  @override
  String get message => _message;

  @override
  bool Function(DartType? type) get checker => radius.isAssignableFromType;
}
