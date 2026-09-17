import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

class FlintUiBottomNavigationBarItem extends StatelessWidget {
  const FlintUiBottomNavigationBarItem({
    this.child,
    this.builder,
    this.onPressed,
    this.isActive = false,
    super.key,
  }) : assert(child != null || builder != null);

  final Widget? child;
  final Widget Function(BuildContext context, bool isActive)? builder;
  final VoidCallback? onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ? context.themeData.textStyles.titleMedium.color
        : context.themeData.textStyles.titleMedium.color.alpha50;

    return GestureDetector(
      behavior: .translucent,
      onTap: onPressed,
      child: DefaultFlintUiIconStyle(
        style: context.themeData.iconStyles.fromTextStyle(
          context.themeData.textStyles.titleLarge.copyWith(
            color: color,
          ),
        ),
        child: DefaultFlintUiTextStyle(
          style: context.themeData.textStyles.labelMedium.copyWith(
            color: color,
          ),
          child: DefaultFlintUiFlexDivider(
            divider: FlintUiGap.column(context.themeData.spacing.xxxs),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.themeData.spacing.md,
              ),
              child: child ?? builder?.call(context, isActive) ?? Center(),
            ),
          ),
        ),
      ),
    );
  }
}

class FlintUiBottomNavigationBar extends StatelessWidget {
  FlintUiBottomNavigationBar({
    required this.items,
    super.key,
  }) : assert(items.isNotEmpty, 'Items list cannot be empty');

  final List<FlintUiBottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(
      horizontal: context.themeData.spacing.xs,
      vertical: context.themeData.spacing.xs,
    ),
    child: SafeArea(
      top: false,
      child: FlintUiFlex.row(
        children: items.map((item) => Expanded(child: item)).toList(),
      ),
    ),
  );
}
