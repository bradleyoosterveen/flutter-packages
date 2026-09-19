import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

class FlintUiAppBar extends StatelessWidget {
  const FlintUiAppBar({
    this.titleText,
    this.onGoBack,
    this.onClose,
    this.actions,
    this.leadingWidget,
    this.trailingWidget,
    super.key,
  });

  final String? titleText;
  final VoidCallback? onGoBack;
  final VoidCallback? onClose;
  final List<Widget>? actions;
  final Widget? leadingWidget;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    final title = titleText;
    final leading = leadingWidget;
    final trailing = trailingWidget;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.08,
      ),
      child: Row(
        children: [
          Expanded(
            child: FlintUiFlex.row(
              divider: FlintUiGap.row(context.themeData.spacing.xs),
              children: [
                if (onGoBack != null) ...[
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeInOutCubic,
                    opacity: onGoBack != null ? 1 : 0,
                    child: FlintUiButton.square(
                      style: (_) => context.themeData.buttonStyles.ghost,
                      onPressed: onGoBack,
                      child: FlintUiIcon.chevronLeft(),
                    ),
                  ),
                ],
                if (leading != null) ...[leading],
              ],
            ),
          ),
          if (title != null) ...[
            FlintUiText(
              title,
              style: (_) => context.themeData.textStyles.titleMedium,
            ),
          ],
          Expanded(
            child: FlintUiFlex.row(
              mainAxisAlignment: MainAxisAlignment.end,
              divider: FlintUiGap.row(context.themeData.spacing.sm),
              children: [
                if (actions != null && actions!.isNotEmpty) ...[...actions!],
                if (trailing != null) ...[trailing],
                if (onClose != null) ...[
                  AnimatedScale(
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeInOutCubic,
                    scale: onClose != null ? 1 : 0,
                    child: FlintUiButton.square(
                      style: (_) => context.themeData.buttonStyles.ghost,
                      onPressed: onClose,
                      child: FlintUiIcon.x(),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
