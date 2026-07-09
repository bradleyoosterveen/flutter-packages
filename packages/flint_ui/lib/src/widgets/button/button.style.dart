part of 'button.dart';

class DefaultFlintUiButtonStyle extends InheritedWidget {
  const DefaultFlintUiButtonStyle({
    super.key,
    required this.style,
    required super.child,
  });

  final FlintUiButtonStyle style;

  static FlintUiButtonStyle of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DefaultFlintUiButtonStyle>()?.style ??
      context.themeData.buttonStyles.primary;

  @override
  bool updateShouldNotify(covariant DefaultFlintUiButtonStyle oldWidget) => !(style == oldWidget.style);
}

class FlintUiButtonStyle {
  final FlintUiColor backgroundColor;
  final FlintUiColor foregroundColor;
  final FlintUiColor borderColor;
  final double borderRadius;

  const FlintUiButtonStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.borderRadius,
  });

  FlintUiButtonStyle copyWith({
    FlintUiColor? backgroundColor,
    FlintUiColor? foregroundColor,
    FlintUiColor? borderColor,
    double? borderRadius,
  }) => FlintUiButtonStyle(
    backgroundColor: backgroundColor ?? this.backgroundColor,
    foregroundColor: foregroundColor ?? this.foregroundColor,
    borderColor: borderColor ?? this.borderColor,
    borderRadius: borderRadius ?? this.borderRadius,
  );
}

class FlintUiButtonStyles {
  final FlintUiButtonStyle primary;
  final FlintUiButtonStyle secondary;
  final FlintUiButtonStyle outline;
  final FlintUiButtonStyle ghost;

  const FlintUiButtonStyles({
    required this.primary,
    required this.secondary,
    required this.outline,
    required this.ghost,
  });
}
