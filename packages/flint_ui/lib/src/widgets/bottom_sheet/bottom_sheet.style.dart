import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/widgets.dart';

class DefaultFlintUiBottomSheetStyle extends InheritedWidget {
  const DefaultFlintUiBottomSheetStyle({
    super.key,
    required this.style,
    required super.child,
  });

  final FlintUiBottomSheetStyle style;

  static FlintUiBottomSheetStyle of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DefaultFlintUiBottomSheetStyle>()?.style ??
      context.themeData.bottomSheetStyles.primary;

  @override
  bool updateShouldNotify(covariant DefaultFlintUiBottomSheetStyle oldWidget) => !(style == oldWidget.style);
}

class FlintUiBottomSheetStyle {
  final FlintUiColor backgroundColor;
  final double borderRadius;

  const FlintUiBottomSheetStyle({
    required this.backgroundColor,
    required this.borderRadius,
  });

  FlintUiBottomSheetStyle copyWith({
    FlintUiColor? backgroundColor,
    double? borderRadius,
  }) => FlintUiBottomSheetStyle(
    backgroundColor: backgroundColor ?? this.backgroundColor,
    borderRadius: borderRadius ?? this.borderRadius,
  );
}

class FlintUiBottomSheetStyles {
  final FlintUiBottomSheetStyle primary;

  const FlintUiBottomSheetStyles({
    required this.primary,
  });
}
