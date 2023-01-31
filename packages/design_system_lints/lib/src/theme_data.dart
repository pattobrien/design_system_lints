import 'package:analyzer/dart/element/type.dart';
import 'package:design_system_lints/src/constants.dart';
import 'package:sidecar/sidecar.dart';

import 'generic_rule.dart';

class ThemeData extends GenericDesignRule {
  static const id = 'theme_data';

  @override
  LintCode get code => const LintCode(id, package: kPackageId);

  @override
  bool Function(DartType? type) get checker => themeData.isAssignableFromType;

  @override
  String get correction => '';

  @override
  String get message => '';
}
