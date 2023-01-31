import 'package:analyzer/dart/element/type.dart';
import 'package:sidecar/sidecar.dart';

import 'constants.dart';
import 'generic_rule.dart';

/// Avoid using hardcoded text styles.
class TextStyle extends GenericDesignRule {
  static const _id = 'text_style';
  static const _message = 'Avoid hardcoded TextStyle values';
  static const _correction = 'Use values in design system spec instead';

  @override
  LintCode get code => const LintCode(_id, package: kPackageId, url: kUrl);

  @override
  bool Function(DartType? type) get checker => textStyle.isAssignableFromType;

  @override
  String get correction => _correction;

  @override
  String get message => _message;
}
