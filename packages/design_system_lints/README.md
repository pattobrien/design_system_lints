# Design System Lints

<a href="https://github.com/pattobrien/design_system_lints/actions"><img src="https://github.com/pattobrien/design_system_lints/workflows/Build/badge.svg" alt="Build Status"></a>
<a href="https://codecov.io/gh/design_system_lints/sidecar"><img src="https://codecov.io/gh/pattobrien/design_system_lints/branch/master/graph/badge.svg" alt="codecov"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
[![pub package](https://img.shields.io/pub/v/design_system_lints.svg)](https://pub.dev/packages/design_system_lints)

A collection of lints and code edits enforcing UI standards throughout a codebase. 

> An analyzer rule package built using [Sidecar](https://pub.dev/packages/sidecar) 

## Overview

As a project scales, UI consistency becomes more difficult to maintain if a centralized source of design elements is not set in place. No matter how subtle the differences are, inconsistent widget sizes or colors become more apparent and user satisfaction inevitably declines.

The concept of a design system is simple: define the basic UI building blocks for your product or brand in one central location, and reference them from anywhere in your codebase. By sticking to a system, clients or designers can maintain visual styles in one place, making it effortless for developers to implement beautiful UIs throughout the application.

For more info on the benefits of using a design system, take a look at [this great article by supernova.io](https://www.supernova.io/blog/what-is-a-design-system), a design system app built with Flutter.

## Available Rules
```yaml
# copy these contents to sidecar.yaml at
includes:
  - "lib/**.dart"

lints:
  design_system_lints:
    rules:
      box_constraints:
      box_shadow:
      color:
      edge_insets:
      icon:
      radius:
      text_style:
      theme_data:
        # additionally, severity for each rule can be set to
        # either: info, warning, or error
        severity: warning


```

## Setup


1. Add `design_system_lints` as a dev_dependency and 
`design_system_annotations` as a regular dependency to your app's pubspec:

```yaml
name: example_app

environment:
  sdk: ">=2.18.0 <3.0.0"

dependencies:
  design_system_annotations: ^0.1.0
  flutter:
    sdk: flutter

dev_dependencies:
  design_system_lints: ^0.1.0

```

2. Create a sidecar.yaml file and add the rules you want to enable for your codebase:

```yaml
# sidecar.yaml
includes:
  - "lib/**.dart"

lints:
  design_system_lints:
    rules:
      icon:
      box_constraints:
      text_style:
      radius:
      box_shadow:
      edge_insets:
      color:
      theme_data:
        # severity for each rule can be set to
        # either: info, warning, or error
        severity: info
```

3. Finally, enable the sidecar plugin in `analysis_options.yaml` at the root of your project
so that the lints can run in your IDE:

```yaml
# analysis_options.yaml
analyzer:
  plugins:
    - sidecar
```

To learn more about using rules in your project (including CLI), follow the usage guide over at [sidecaranalyzer.dev](https://sidecaranalyzer.dev/docs/usage/intial_setup).

## Usage

Once the rules are enabled, the lints are designed to show info messages wherever design system rules are not properly followed. For example, the `edge_insets` rule enforces a standard usage of padding and margins by locating `EdgeInsets` code that uses sizes defined outside of a design system.

```dart
import 'package:flutter/material.dart';

final large = 12.0;

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // appears for hardcoded integer or double values
      padding: EdgeInsets.only(left: 11.0, right: 9.0), // lint: edge_insets

      // also appears when using variables that are declared
      // outside of a design system
      margin: EdgeInsets.all(large), // lint: edge_insets
    );
  }
}
```

Instead of using any variable for your padding, which is hard to maintain as your application scales, its better to define sizing by either using static variables.

The package [`design_system_annotations`](https://pub.dev/packages/design_system_annotations) allows you to annotate your size variables with `@designSystem`, and permits their use throughout your codebase.

```dart
import 'package:design_system_annotations/design_system_annotations.dart';
import 'package:flutter/material.dart';

// create your design system values
// the below values happen to follow the concept of an 8pt scale
// see: https://medium.com/swlh/the-comprehensive-8pt-grid-guide-aa16ff402179
@designSystem
class DesignSystem {
  static const xsmall = 2.0;
  static const small = 4.0;
  static const medium = 8.0;
  static const large = 12.0;
  static const xlarge = 16.0;

  static const primary = Color(0x02569B);
  static const secondary = Color(0x12B9FD);
}

// use the design system anywhere throughout your codebase
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignSystem.primary, // no lint
      padding: EdgeInsets.all(DesignSystem.large), // no lint
    );
  }
}
```
The above design system was defined using whats known as the [8pt system](https://medium.com/swlh/the-comprehensive-8pt-grid-guide-aa16ff402179), which just about guarantees a consistent and perfectly flexible UI in your Flutter app.

Enforcing use of a highly maintainable UI system is as easy as that!

You can additionally use `design_system_lints` to enforce many different types of parameters,
including `SizedBox` and `Container` height and width values, `Color` values, `Icon` values,
and more.

## Further resources

Sidecar is a new package that allows anyone to create custom rules for their codebase. Since custom rules 
are a relatively new concept, further questions and feedback are expected.
We encourage you to join the conversation on [discord](https://discord.com/invite/YhFS6V26Vg) and follow the [sidecar project](https://github.com/pattobrien/sidecar).

