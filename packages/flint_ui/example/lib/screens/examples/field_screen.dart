import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

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
      children: [
        FlintUiField.text(
          placeholderText: 'Field (text)',
        ),
        FlintUiFieldGroup(
          label: FlintUiText('Label'),
          field: FlintUiField.text(
            placeholderText: 'Field (text, in FlintUiFieldGroup)',
          ),
        ),
        FlintUiField.text(
          placeholderText: 'Field (text with suffix)',
          suffix: FlintUiButton.square(
            size: .small,
            style: (_) => context.themeData.buttonStyles.ghost,
            onPressed: () {},
            child: FlintUiIcon.clipboardPaste(),
          ),
        ),
        FlintUiField.text(
          placeholderText: 'Field (text with multiple suffix)',
          suffix: FlintUiFlex.row(
            children: [
              FlintUiButton.square(
                size: .small,
                style: (_) => context.themeData.buttonStyles.ghost,
                onPressed: () {},
                child: FlintUiIcon.search(),
              ),
              FlintUiButton.square(
                size: .small,
                style: (_) => context.themeData.buttonStyles.ghost,
                onPressed: () {},
                child: FlintUiIcon.x(),
              ),
            ],
          ),
        ),
        FlintUiField.multiline(
          placeholderText: 'Field (multiline)',
        ),
        FlintUiField.password(
          placeholderText: 'Field (password)',
        ),
        FlintUiField.password(
          placeholderText: 'Field (password with suffix)',
          suffix: FlintUiButton.square(
            size: .small,
            style: (_) => context.themeData.buttonStyles.ghost,
            onPressed: () {},
            child: FlintUiIcon.clipboardPaste(),
          ),
        ),
      ],
    ),
  );
}
