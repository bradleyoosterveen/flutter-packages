import 'package:flutter/widgets.dart';
import 'package:flint_ui/flint_ui.dart';

class FlintUiTheme extends InheritedWidget {
  const FlintUiTheme({super.key, required super.child, required this.data});

  final FlintUiThemeData data;

  static FlintUiThemeData of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<FlintUiTheme>()!.data;

  @override
  bool updateShouldNotify(covariant FlintUiTheme oldWidget) => data != oldWidget.data;
}
