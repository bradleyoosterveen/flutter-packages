import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  static Future<dynamic> push(BuildContext context) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => TextScreen()));

  @override
  Widget build(BuildContext context) => FlintUiScaffold(
    header: FlintUiAppBar(titleText: 'UiText', onGoBack: Navigator.of(context).pop),
    body: FlintUiFlex.column(
      divider: FlintUiGap.column(context.themeData.spacing.sm),
      children: [
        // Display styles
        FlintUiText(
          'Display Large',
          style: (s) => context.themeData.textStyles.displayLarge,
        ),
        FlintUiText(
          'Display Medium',
          style: (s) => context.themeData.textStyles.displayMedium,
        ),
        FlintUiText(
          'Display Small',
          style: (s) => context.themeData.textStyles.displaySmall,
        ),
        // Headline styles
        FlintUiText(
          'Headline Large',
          style: (s) => context.themeData.textStyles.headlineLarge,
        ),
        FlintUiText(
          'Headline Medium',
          style: (s) => context.themeData.textStyles.headlineMedium,
        ),
        FlintUiText(
          'Headline Small',
          style: (s) => context.themeData.textStyles.headlineSmall,
        ),
        // Title styles
        FlintUiText(
          'Title Large',
          style: (s) => context.themeData.textStyles.titleLarge,
        ),
        FlintUiText(
          'Title Medium',
          style: (s) => context.themeData.textStyles.titleMedium,
        ),
        FlintUiText(
          'Title Small',
          style: (s) => context.themeData.textStyles.titleSmall,
        ),
        // Body styles
        FlintUiText(
          'Body Large',
          style: (s) => context.themeData.textStyles.bodyLarge,
        ),
        FlintUiText(
          'Body Medium',
          style: (s) => context.themeData.textStyles.bodyMedium,
        ),
        FlintUiText(
          'Body Small',
          style: (s) => context.themeData.textStyles.bodySmall,
        ),
        // Label styles
        FlintUiText(
          'Label Large',
          style: (s) => context.themeData.textStyles.labelLarge,
        ),
        FlintUiText(
          'Label Medium',
          style: (s) => context.themeData.textStyles.labelMedium,
        ),
        FlintUiText(
          'Label Small',
          style: (s) => context.themeData.textStyles.labelSmall,
        ),
        FlintUiText(
          'Dim variant',
          style: (s) => context.themeData.textStyles.titleMedium,
        ).dim(),
      ],
    ),
  );
}
