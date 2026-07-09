import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flint_ui/flint_ui.dart';

class FlintUiApp extends StatelessWidget {
  const FlintUiApp({required this.child, required this.themeData, super.key});

  final Widget child;
  final FlintUiThemeData themeData;

  @override
  Widget build(BuildContext context) => FlintUiTheme(
    data: themeData,
    child: AnnotatedRegion<SystemUiOverlayStyle>(
      value: themeData.brightness == .dark ? .light : .dark,
      child: Scaffold(body: FlintUiAlertOverlay(child: child)),
    ),
  );
}
