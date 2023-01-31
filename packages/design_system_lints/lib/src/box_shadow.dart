import 'package:analyzer/dart/element/type.dart';
import 'package:sidecar/sidecar.dart';

import 'constants.dart';
import 'generic_rule.dart';
import 'utils.dart';

/// Avoid hardcoding BoxShadows.
class BoxShadow extends GenericDesignRule {
  static const _id = 'box_shadow';
  static const _message = 'Avoid BoxShadow literal';
  static const _correction = 'Use values in design system spec instead';

  @override
  LintCode get code => const LintCode(_id, package: kPackageId, url: kUrl);

  @override
  bool Function(DartType? type) get checker => isBoxShadowOrList;

  @override
  String get correction => _correction;

  @override
  String get message => _message;
}

bool isBoxShadowOrList(DartType? type) =>
    isListOfType(boxShadow, type) || boxShadow.isAssignableFromType(type);
