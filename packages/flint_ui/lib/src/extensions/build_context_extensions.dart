import 'package:flutter/cupertino.dart';
import 'package:flint_ui/flint_ui.dart';

extension FlintUiBuildContextExtension on BuildContext {
  FlintUiThemeData get themeData => FlintUiTheme.of(this);
}
