/// Base for Design System annotations
///
/// When used to annotate classes or methods, ```design_system_lints``` will
/// allow annotated declartions to be used throughout a codebase. Otherwise,
/// non-annotated classes will show lint messages or errors.
///
/// ```dart
/// @designSystem
/// class CustomDesignSystem {
///   static const Color primary = Colors.blue;
///   static const Color secondary = Colors.yellow;
/// }
///
/// final myBrandTheme = ThemeData(
///   primaryColor: CustomDesignSystem.primary, // no lint
///   accentColor: Colors.red, // shows a lint
/// );
///
/// ```
class DesignSystem {
  const DesignSystem();
}

/// Base for Design System annotations
///
/// When used to annotate classes or methods, ```design_system_lints``` will
/// allow annotated declartions to be used throughout a codebase. Otherwise,
/// non-annotated classes will show lint messages or errors.
///
/// ```dart
/// @designSystem
/// class CustomDesignSystem {
///   static const Color primary = Colors.blue;
///   static const Color secondary = Colors.yellow;
/// }
///
/// final myBrandTheme = ThemeData(
///   primaryColor: CustomDesignSystem.primary, // no lint
///   accentColor: Colors.red, // shows a lint
/// );
///
/// ```
const designSystem = DesignSystem();
