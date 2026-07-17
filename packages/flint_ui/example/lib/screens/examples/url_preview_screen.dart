import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

class UrlPreviewScreen extends StatelessWidget {
  const UrlPreviewScreen({super.key});

  static Future<dynamic> push(BuildContext context) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => UrlPreviewScreen()));

  @override
  Widget build(BuildContext context) => FlintUiScaffold(
    header: FlintUiAppBar(
      titleText: 'UiUrlPreview',
      onGoBack: Navigator.of(context).pop,
    ),
    body: FlintUiFlex.column(
      divider: FlintUiGap.column(context.themeData.spacing.sm),
      children: [FlintUiUrlPreview(url: 'https://www.google.com/')],
    ),
  );
}
