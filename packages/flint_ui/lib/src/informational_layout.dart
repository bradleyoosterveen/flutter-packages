import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

class FlintUiInformationalLayout extends StatelessWidget {
  const FlintUiInformationalLayout({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.actions = const [],
    this.body,
    super.key,
  });

  final FlintUiIcon icon;
  final String title;
  final String subtitle;
  final List<Widget> actions;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final bodyWidget = body;
    final titleStyle = context.themeData.textStyles.headlineMedium;

    return FlintUiFlex.column(
      mainAxisSize: .min,
      divider: FlintUiGap.column(context.themeData.spacing.lg),
      children: [
        DefaultFlintUiIconStyle(
          style: context.themeData.iconStyles.fromTextStyle(titleStyle),
          child: icon,
        ),
        FlintUiFlex.column(
          mainAxisSize: .min,
          crossAxisAlignment: .center,
          divider: FlintUiGap.column(context.themeData.spacing.xs),
          children: [
            FlintUiText(
              title,
              style: (_) => context.themeData.textStyles.titleLarge,
            ).centered(),
            FlintUiText(subtitle).centered(),
          ],
        ),
        if (bodyWidget != null) ...[bodyWidget],
        if (actions.isNotEmpty) ...[
          FlintUiFlex.column(
            mainAxisSize: .min,
            divider: FlintUiGap.column(context.themeData.spacing.xs),
            children: actions,
          ),
        ],
      ],
    );
  }
}
