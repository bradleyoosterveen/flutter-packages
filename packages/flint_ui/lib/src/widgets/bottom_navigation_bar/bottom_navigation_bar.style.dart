part of 'bottom_navigation_bar.dart';

class DefaultUiBottomNavigationBarStyle extends InheritedWidget {
  const DefaultUiBottomNavigationBarStyle({
    super.key,
    required this.style,
    required super.child,
  });

  final FlintUiBottomNavigationBarStyle style;

  static FlintUiBottomNavigationBarStyle of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DefaultUiBottomNavigationBarStyle>()?.style ??
      context.themeData.bottomNavigationBarStyles.primary;

  @override
  bool updateShouldNotify(
    covariant DefaultUiBottomNavigationBarStyle oldWidget,
  ) => !(style == oldWidget.style);
}

class DefaultUiBottomNavigationBarItemStyle extends InheritedWidget {
  const DefaultUiBottomNavigationBarItemStyle({
    super.key,
    required this.style,
    required super.child,
  });

  final FlintUiBottomNavigationBarItemStyle style;

  static FlintUiBottomNavigationBarItemStyle of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DefaultUiBottomNavigationBarItemStyle>()?.style ??
      context.themeData.bottomNavigationBarItemStyles.primary;

  @override
  bool updateShouldNotify(
    covariant DefaultUiBottomNavigationBarItemStyle oldWidget,
  ) => !(style == oldWidget.style);
}

class FlintUiBottomNavigationBarStyle {
  final FlintUiColor backgroundColor;
  final FlintUiColor borderColor;
  final double borderRadius;

  const FlintUiBottomNavigationBarStyle({
    required this.backgroundColor,
    required this.borderColor,
    required this.borderRadius,
  });

  FlintUiBottomNavigationBarStyle copyWith({
    FlintUiColor? backgroundColor,
    FlintUiColor? borderColor,
    double? borderRadius,
  }) => FlintUiBottomNavigationBarStyle(
    backgroundColor: backgroundColor ?? this.backgroundColor,
    borderColor: borderColor ?? this.borderColor,
    borderRadius: borderRadius ?? this.borderRadius,
  );
}

class FlintUiBottomNavigationBarItemStyle {
  final FlintUiColor activeBackgroundColor;
  final FlintUiColor inactiveBackgroundColor;
  final FlintUiColor activeForegroundColor;
  final FlintUiColor inactiveForegroundColor;

  const FlintUiBottomNavigationBarItemStyle({
    required this.activeBackgroundColor,
    required this.inactiveBackgroundColor,
    required this.activeForegroundColor,
    required this.inactiveForegroundColor,
  });

  FlintUiBottomNavigationBarItemStyle copyWith({
    FlintUiColor? activeBackgroundColor,
    FlintUiColor? inactiveBackgroundColor,
    FlintUiColor? activeForegroundColor,
    FlintUiColor? inactiveForegroundColor,
  }) => FlintUiBottomNavigationBarItemStyle(
    activeBackgroundColor: activeBackgroundColor ?? this.activeBackgroundColor,
    inactiveBackgroundColor: inactiveBackgroundColor ?? this.inactiveBackgroundColor,
    activeForegroundColor: activeForegroundColor ?? this.activeForegroundColor,
    inactiveForegroundColor: inactiveForegroundColor ?? this.inactiveForegroundColor,
  );
}

class FlintUiBottomNavigationBarItemStyles {
  final FlintUiBottomNavigationBarItemStyle primary;

  const FlintUiBottomNavigationBarItemStyles({required this.primary});
}

class FlintUiBottomNavigationBarStyles {
  final FlintUiBottomNavigationBarStyle primary;

  const FlintUiBottomNavigationBarStyles({required this.primary});
}
