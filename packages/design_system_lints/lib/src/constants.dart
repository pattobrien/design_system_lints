import 'package:sidecar/sidecar.dart';

/// Design system lints package Id.
const kPackageId = 'design_system_lints';

/// Url for design-system-lints github repo.
const kUrl =
    'https://github.com/pattobrien/lints/tree/main/packages/design_system_lints';

const boxShadow = TypeChecker.fromPackage('BoxShadow', package: 'flutter');
const themeData = TypeChecker.fromPackage('ThemeData', package: 'flutter');
const textStyle = TypeChecker.fromPackage('TextStyle', package: 'flutter');
const container = TypeChecker.fromPackage('Container', package: 'flutter');
const sizedBox = TypeChecker.fromPackage('SizedBox', package: 'flutter');
const edgeInsets = TypeChecker.fromPackage('EdgeInsets', package: 'flutter');
const iconData = TypeChecker.fromPackage('IconData', package: 'flutter');
const color = TypeChecker.fromDart('Color', package: 'ui');
const radius = TypeChecker.fromDart('Radius', package: 'ui');
