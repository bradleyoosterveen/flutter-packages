part of 'field.dart';

class DefaultFlintUiFieldStyle extends InheritedWidget {
  const DefaultFlintUiFieldStyle({
    super.key,
    required this.style,
    required super.child,
  });

  final FlintUiFieldStyle style;

  static FlintUiFieldStyle of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DefaultFlintUiFieldStyle>()?.style ??
      context.themeData.fieldStyles.primary;

  @override
  bool updateShouldNotify(covariant DefaultFlintUiFieldStyle oldWidget) => !(style == oldWidget.style);
}

class FlintUiFieldStyle {
  final FlintUiColor backgroundColor;
  final FlintUiColor borderColor;
  final double borderRadius;

  const FlintUiFieldStyle({
    required this.backgroundColor,
    required this.borderColor,
    required this.borderRadius,
  });

  FlintUiFieldStyle copyWith({
    FlintUiColor? backgroundColor,
    FlintUiColor? borderColor,
    double? borderRadius,
  }) => FlintUiFieldStyle(
    backgroundColor: backgroundColor ?? this.backgroundColor,
    borderColor: borderColor ?? this.borderColor,
    borderRadius: borderRadius ?? this.borderRadius,
  );
}

class FlintUiFieldStyles {
  final FlintUiFieldStyle primary;

  const FlintUiFieldStyles({required this.primary});
}
