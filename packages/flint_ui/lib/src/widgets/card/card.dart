import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/widgets.dart';

part 'card.style.dart';

class FlintUiCard extends StatelessWidget {
  static FlintUiCardStyle _defaultStyleBuilder(FlintUiCardStyle style) => style;
  static VoidCallback _defaultOnPressed() => () {};

  const FlintUiCard({
    required this.child,
    this.style = _defaultStyleBuilder,
    this.size = FlintUiCardSize.medium,
    this.onPressed = _defaultOnPressed,
    super.key,
  });

  final Widget child;
  final FlintUiCardStyle Function(FlintUiCardStyle style) style;
  final FlintUiCardSize size;
  final VoidCallback onPressed;

  EdgeInsets _padding(BuildContext context) => switch (size) {
    FlintUiCardSize.extraSmall => EdgeInsets.symmetric(
      vertical: context.themeData.spacing.xs,
      horizontal: context.themeData.spacing.sm,
    ),
    FlintUiCardSize.small => EdgeInsets.symmetric(
      vertical: context.themeData.spacing.sm,
      horizontal: context.themeData.spacing.md,
    ),
    FlintUiCardSize.medium => EdgeInsets.symmetric(
      vertical: context.themeData.spacing.md,
      horizontal: context.themeData.spacing.lg,
    ),
    FlintUiCardSize.large => EdgeInsets.symmetric(
      vertical: context.themeData.spacing.lg,
      horizontal: context.themeData.spacing.xl,
    ),
  };

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = style(DefaultFlintUiCardStyle.of(context));

    return GestureDetector(
      behavior: .translucent,
      onTap: onPressed,
      child: Container(
        clipBehavior: .antiAlias,
        decoration: BoxDecoration(
          color: resolvedStyle.backgroundColor.color,
          borderRadius: .circular(resolvedStyle.borderRadius),
          border: .all(
            color: resolvedStyle.borderColor.color,
            width: 1,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: Padding(padding: _padding(context), child: child),
      ),
    );
  }
}

enum FlintUiCardSize { extraSmall, small, medium, large }
