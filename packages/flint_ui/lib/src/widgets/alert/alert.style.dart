part of 'alert.dart';

class DefaultFlintUiAlertStyle extends InheritedWidget {
  const DefaultFlintUiAlertStyle({
    super.key,
    required this.style,
    required super.child,
  });

  final FlintUiAlertStyle style;

  static FlintUiAlertStyle of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DefaultFlintUiAlertStyle>()?.style ??
      context.themeData.alertStyles.info;

  @override
  bool updateShouldNotify(covariant DefaultFlintUiAlertStyle oldWidget) => !(style == oldWidget.style);
}

class FlintUiAlertStyle {
  final FlintUiColor backgroundColor;
  final FlintUiColor borderColor;
  final FlintUiColor foregroundColor;
  final double borderRadius;

  const FlintUiAlertStyle({
    required this.backgroundColor,
    required this.borderColor,
    required this.foregroundColor,
    required this.borderRadius,
  });
}

class FlintUiAlertStyles {
  final FlintUiAlertStyle info;
  final FlintUiAlertStyle success;
  final FlintUiAlertStyle warning;
  final FlintUiAlertStyle error;

  const FlintUiAlertStyles({
    required this.info,
    required this.success,
    required this.warning,
    required this.error,
  });
}
