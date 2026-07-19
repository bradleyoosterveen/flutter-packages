import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

part 'bottom_navigation_bar.style.dart';

class FlintUiBottomNavigationBarItem extends StatelessWidget {
  static FlintUiBottomNavigationBarItemStyle _defaultStyleBuilder(
    FlintUiBottomNavigationBarItemStyle style,
  ) => style;

  const FlintUiBottomNavigationBarItem({
    required this.icon,
    this.onPressed,
    this.isActive = false,
    this.style = _defaultStyleBuilder,
    super.key,
  });

  final FlintUiIcon icon;
  final VoidCallback? onPressed;
  final bool isActive;
  final FlintUiBottomNavigationBarItemStyle Function(
    FlintUiBottomNavigationBarItemStyle style,
  )
  style;

  @override
  Widget build(BuildContext context) => FlintUiButton.square(
    style: (_) => isActive ? context.themeData.buttonStyles.primary : context.themeData.buttonStyles.ghost,
    onPressed: onPressed,
    size: .large,
    child: icon,
  );
}

class FlintUiBottomNavigationBar extends StatelessWidget {
  static FlintUiBottomNavigationBarStyle _defaultStyleBuilder(
    FlintUiBottomNavigationBarStyle style,
  ) => style;

  FlintUiBottomNavigationBar({
    required this.items,
    this.style = _defaultStyleBuilder,
    super.key,
  }) : assert(items.isNotEmpty, 'Items list cannot be empty');

  final List<FlintUiBottomNavigationBarItem> items;
  final FlintUiBottomNavigationBarStyle Function(FlintUiBottomNavigationBarStyle style) style;

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = style(DefaultUiBottomNavigationBarStyle.of(context));

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.themeData.spacing.xs,
        vertical: context.themeData.spacing.sm,
      ),
      child: SafeArea(
        top: false,
        child: Container(
          clipBehavior: .none,
          decoration: BoxDecoration(
            color: resolvedStyle.backgroundColor.color,
            borderRadius: .circular(resolvedStyle.borderRadius),
            border: .all(
              color: resolvedStyle.borderColor.color,
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(context.themeData.spacing.xs),
            child: FlintUiFlex.row(
              mainAxisAlignment: .spaceBetween,
              children: items,
            ),
          ),
        ),
      ),
    );
  }
}
