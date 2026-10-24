import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/cupertino.dart';

extension FlintUiBuildContextExtension on BuildContext {
  FlintUiThemeData get themeData => FlintUiTheme.of(this);

  /// Finds inherited widget [T] in ancestors, returning null if not found or if nested inside [W].
  /// Use: `MyInheritedWidget? data = context.findInheritedWidgetIfNotIn<MyInheritedWidget, BlockingWidget>();`
  T? findInheritedWidgetIfNotIn<T extends InheritedWidget, W extends Widget>() {
    bool? foundType;

    visitAncestorElements((element) {
      if (element.widget is W) {
        foundType = true;
        return false;
      }
      if (element.widget is T) {
        foundType = false;
        return false;
      }
      return true;
    });

    return foundType == false ? dependOnInheritedWidgetOfExactType<T>() : null;
  }
}
