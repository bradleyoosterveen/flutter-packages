import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

class FlintUiListItem extends StatelessWidget {
  const FlintUiListItem({
    this.title,
    this.subtitle,
    this.prefix,
    this.suffix,
    super.key,
  });

  final Widget? title;
  final Widget? subtitle;
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    final titleWidget = title;
    final subtitleWidget = subtitle;

    return FlintUiFlex.row(
      divider: FlintUiGap.row(context.themeData.spacing.md),
      children: [
        ?prefix,
        if (title != null || subtitle != null) ...[
          Expanded(
            child: FlintUiFlex.column(
              divider: FlintUiGap.column(context.themeData.spacing.xxxs),
              crossAxisAlignment: .start,
              children: [
                if (titleWidget != null) ...[
                  DefaultFlintUiTextStyle(style: context.themeData.textStyles.titleSmall, child: titleWidget),
                ],
                if (subtitleWidget != null) ...[
                  DefaultFlintUiTextStyle(style: context.themeData.textStyles.bodyMedium, child: subtitleWidget),
                ],
              ],
            ),
          ),
        ],
        ?suffix,
      ],
    );
  }
}
