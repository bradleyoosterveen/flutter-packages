import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

class FlintUiInformationalLayout extends StatelessWidget {
  const FlintUiInformationalLayout({
    required this.title,
    required this.subtitle,
    this.icon,
    this.actions = const [],
    this.body,
    super.key,
  });

  final String title;
  final String subtitle;
  final FlintUiIcon? icon;
  final List<Widget> actions;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final iconWidget = icon;
    final bodyWidget = body;
    final titleStyle = context.themeData.textStyles.headlineMedium;

    return FlintUiFlex.column(
      mainAxisSize: .min,
      divider: FlintUiGap.column(context.themeData.spacing.lg),
      children: [
        if (iconWidget != null) ...[
          DefaultFlintUiIconStyle(
            style: context.themeData.iconStyles.fromTextStyle(titleStyle),
            child: iconWidget,
          ),
        ],
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
