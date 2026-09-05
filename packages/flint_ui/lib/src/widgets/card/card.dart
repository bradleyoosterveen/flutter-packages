import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/widgets.dart';

part 'card.style.dart';

class _FlintUiCardGroupItemData extends InheritedWidget {
  const _FlintUiCardGroupItemData({
    required super.child,
    required this.isFirst,
    required this.isLast,
  });

  final bool isFirst;
  final bool isLast;

  static _FlintUiCardGroupItemData? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_FlintUiCardGroupItemData>();

  @override
  bool updateShouldNotify(_FlintUiCardGroupItemData old) => true;
}

class FlintUiCardGroup extends StatelessWidget {
  const FlintUiCardGroup({
    required this.cards,
    super.key,
  });

  final List<FlintUiCard> cards;

  @override
  Widget build(BuildContext context) => FlintUiFlex.column(
    divider: FlintUiGap.column(context.themeData.spacing.xxxs),
    crossAxisAlignment: .stretch,
    children: List.generate(
      cards.length,
      (index) => _FlintUiCardGroupItemData(
        isFirst: index == 0,
        isLast: index + 1 == cards.length,
        child: cards[index],
      ),
    ),
  );
}

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
    final groupItemData = _FlintUiCardGroupItemData.maybeOf(context);

    final defaultBorderRadius = BorderRadius.circular(resolvedStyle.borderRadius);

    final BorderRadiusGeometry borderRadius = switch (groupItemData) {
      _FlintUiCardGroupItemData data => switch (Never) {
        _ when data.isFirst && data.isLast => defaultBorderRadius,
        _ when !data.isLast && !data.isFirst => BorderRadiusGeometry.circular(0),
        _ when data.isFirst => BorderRadiusGeometry.vertical(top: .circular(resolvedStyle.borderRadius)),
        _ when data.isLast => BorderRadiusGeometry.vertical(bottom: .circular(resolvedStyle.borderRadius)),
        _ => defaultBorderRadius,
      },
      _ => defaultBorderRadius,
    };

    return GestureDetector(
      behavior: .translucent,
      onTap: onPressed,
      child: Container(
        clipBehavior: .antiAlias,
        decoration: BoxDecoration(
          color: resolvedStyle.backgroundColor.color,
          borderRadius: borderRadius,
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
