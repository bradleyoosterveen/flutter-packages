import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

part 'alert.style.dart';

class FlintUiAlert extends StatelessWidget {
  static FlintUiAlertStyle _defaultStyleBuilder(FlintUiAlertStyle style) => style;
  static VoidCallback _defaultOnDismissed() => () {};

  const FlintUiAlert({
    required this.title,
    this.icon,
    this.body,
    this.style = _defaultStyleBuilder,
    this.onDismissed = _defaultOnDismissed,
    super.key,
  });

  final FlintUiIcon? icon;
  final String title;
  final String? body;
  final VoidCallback onDismissed;

  final FlintUiAlertStyle Function(FlintUiAlertStyle style) style;

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = style(DefaultFlintUiAlertStyle.of(context));
    final titleStyle = context.themeData.textStyles.titleMedium.copyWith(
      color: resolvedStyle.foregroundColor,
    );

    final resolvedBody = body;
    final resolvedIcon = icon;

    return GestureDetector(
      behavior: .translucent,
      onTap: onDismissed,
      child: DefaultFlintUiIconStyle(
        style: context.themeData.iconStyles.fromTextStyle(titleStyle),
        child: Container(
          clipBehavior: .antiAlias,
          decoration: BoxDecoration(
            color: resolvedStyle.backgroundColor.color,
            border: .all(width: 1, color: resolvedStyle.borderColor.color),
            borderRadius: .all(.circular(resolvedStyle.borderRadius)),
          ),
          child: Padding(
            padding: .all(context.themeData.spacing.md),
            child: FlintUiFlex.row(
              divider: FlintUiGap.row(context.themeData.spacing.md),
              crossAxisAlignment: resolvedBody != null ? .start : .center,
              children: [
                if (resolvedIcon != null) ...[resolvedIcon],
                Expanded(
                  child: FlintUiFlex.column(
                    divider: FlintUiGap.column(context.themeData.spacing.xxs),
                    crossAxisAlignment: .stretch,
                    children: [
                      FlintUiText(
                        title,
                        style: (style) =>
                            context.themeData.textStyles.titleMedium.copyWith(color: resolvedStyle.foregroundColor),
                      ),
                      if (resolvedBody != null) ...[
                        FlintUiText(
                          resolvedBody,
                          style: (style) => style.copyWith(
                            color: resolvedStyle.foregroundColor,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                FlintUiIcon.x(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
