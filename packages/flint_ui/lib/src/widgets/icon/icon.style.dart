part of 'icon.dart';

class DefaultFlintUiIconStyle extends InheritedWidget {
  const DefaultFlintUiIconStyle({
    super.key,
    required this.style,
    required super.child,
  });

  final FlintUiIconStyle style;

  static FlintUiIconStyle of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DefaultFlintUiIconStyle>()?.style ??
      context.themeData.iconStyles.fromTextStyle(
        context.themeData.textStyles.bodyMedium,
      );

  @override
  bool updateShouldNotify(covariant DefaultFlintUiIconStyle oldWidget) => !(style == oldWidget.style);
}

class FlintUiIconStyle {
  final FlintUiColor color;
  final double size;

  FlintUiIconStyle({required this.color, required this.size});

  FlintUiIconStyle copyWith({FlintUiColor? color, double? size}) =>
      FlintUiIconStyle(color: color ?? this.color, size: size ?? this.size);
}

class FlintUiIconStyles {
  const FlintUiIconStyles();

  FlintUiIconStyle fromTextStyle(FlintUiTextStyle style) => FlintUiIconStyle(color: style.color, size: style.fontSize);
}
