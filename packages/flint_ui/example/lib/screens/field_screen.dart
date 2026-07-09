import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

class FieldScreen extends StatelessWidget {
  const FieldScreen({super.key});

  static Future<dynamic> push(BuildContext context) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => FieldScreen()));

  @override
  Widget build(BuildContext context) => FlintUiScaffold(
    header: FlintUiAppBar(titleText: 'UiField', onGoBack: Navigator.of(context).pop),
    body: FlintUiFlex.column(
      divider: FlintUiGap.column(context.themeData.spacing.sm),
      children: [FlintUiField.text(hasError: true)],
    ),
  );
}
