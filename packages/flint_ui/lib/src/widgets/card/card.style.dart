part of 'card.dart';

class DefaultFlintUiCardStyle extends InheritedWidget {
  const DefaultFlintUiCardStyle({
    super.key,
    required this.style,
    required super.child,
  });

  final FlintUiCardStyle style;

  static FlintUiCardStyle of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DefaultFlintUiCardStyle>()?.style ??
      context.themeData.cardStyles.filled;

  @override
  bool updateShouldNotify(covariant DefaultFlintUiCardStyle oldWidget) => !(style == oldWidget.style);
}

class FlintUiCardStyle {
  final FlintUiColor backgroundColor;
  final FlintUiColor borderColor;
  final double borderRadius;

  const FlintUiCardStyle({
    required this.backgroundColor,
    required this.borderColor,
    required this.borderRadius,
  });

  FlintUiCardStyle copyWith({
    FlintUiColor? backgroundColor,
    FlintUiColor? borderColor,
    double? borderRadius,
  }) => FlintUiCardStyle(
    backgroundColor: backgroundColor ?? this.backgroundColor,
    borderColor: borderColor ?? this.borderColor,
    borderRadius: borderRadius ?? this.borderRadius,
  );
}

class FlintUiCardStyles {
  final FlintUiCardStyle filled;
  final FlintUiCardStyle outline;

  const FlintUiCardStyles({required this.filled, required this.outline});
}
