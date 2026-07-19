import 'package:example/screens/home_screen.dart';
import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = FlintUiThemeData.fromPlatformBrightness(context);

    return MaterialApp(
      theme: themeData.toMaterialTheme(),
      builder: (context, widget) => FlintUiApp(themeData: themeData, child: widget ?? Center()),
      home: HomeScreen(),
    );
  }
}
