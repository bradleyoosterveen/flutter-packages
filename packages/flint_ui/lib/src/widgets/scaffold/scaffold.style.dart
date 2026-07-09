part of 'scaffold.dart';

class DefaultFlintUiScaffoldStyle extends InheritedWidget {
  const DefaultFlintUiScaffoldStyle({
    super.key,
    required this.style,
    required super.child,
  });

  final FlintUiScaffoldStyle style;

  static FlintUiScaffoldStyle of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DefaultFlintUiScaffoldStyle>()?.style ??
      context.themeData.scaffoldStyles.primary;

  @override
  bool updateShouldNotify(covariant DefaultFlintUiScaffoldStyle oldWidget) => !(style == oldWidget.style);
}

class FlintUiScaffoldStyle {
  final FlintUiColor backgroundColor;
  final FlintUiColor floatingHeaderBackgroundColor;
  final double horizontalInset;

  const FlintUiScaffoldStyle({
    required this.backgroundColor,
    required this.floatingHeaderBackgroundColor,
    required this.horizontalInset,
  });

  FlintUiScaffoldStyle copyWith({
    FlintUiColor? backgroundColor,
    FlintUiColor? floatingHeaderBackgroundColor,
    double? horizontalInset,
  }) => FlintUiScaffoldStyle(
    backgroundColor: backgroundColor ?? this.backgroundColor,
    floatingHeaderBackgroundColor: floatingHeaderBackgroundColor ?? this.floatingHeaderBackgroundColor,
    horizontalInset: horizontalInset ?? this.horizontalInset,
  );
}

class FlintUiScaffoldStyles {
  final FlintUiScaffoldStyle primary;

  const FlintUiScaffoldStyles({required this.primary});
}
