import 'package:analyzer/dart/element/type.dart';
import 'package:sidecar/sidecar.dart';

import 'constants.dart';
import 'generic_rule.dart';

/// Avoid using hardcoded Icons.
class Icon extends GenericDesignRule {
  static const _id = 'icon';
  static const _message = 'Icon isn\'t from design system.';
  static const _correction =
      'Prefer to use values from a design system spec instead.';

  @override
  LintCode get code => const LintCode(_id, package: kPackageId, url: kUrl);

  @override
  bool Function(DartType? type) get checker => iconData.isAssignableFromType;

  @override
  String get correction => _correction;

  @override
  String get message => _message;
}
