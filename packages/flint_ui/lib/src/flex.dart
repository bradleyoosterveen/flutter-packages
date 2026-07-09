import 'package:flutter/widgets.dart';

class DefaultFlintUiFlexDivider extends InheritedWidget {
  const DefaultFlintUiFlexDivider({
    required this.divider,
    required super.child,
    super.key,
  });

  final Widget divider;

  static DefaultFlintUiFlexDivider? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DefaultFlintUiFlexDivider>();

  @override
  bool updateShouldNotify(DefaultFlintUiFlexDivider oldWidget) => divider != oldWidget.divider;
}

class FlintUiFlex extends StatelessWidget {
  const FlintUiFlex._({
    this.mainAxisAlignment = .start,
    this.mainAxisSize = .max,
    this.crossAxisAlignment = .center,
    this.textDirection = .ltr,
    this.verticalDirection = .down,
    this.textBaseline = .alphabetic,
    this.direction = .horizontal,
    this.divider,
    this.children = const [],
  });

  factory FlintUiFlex.row({
    MainAxisAlignment mainAxisAlignment = .start,
    MainAxisSize mainAxisSize = .max,
    CrossAxisAlignment crossAxisAlignment = .center,
    TextDirection textDirection = .ltr,
    VerticalDirection verticalDirection = .down,
    TextBaseline textBaseline = .alphabetic,
    Widget? divider,
    List<Widget> children = const [],
  }) => FlintUiFlex._(
    mainAxisAlignment: mainAxisAlignment,
    mainAxisSize: mainAxisSize,
    crossAxisAlignment: crossAxisAlignment,
    textDirection: textDirection,
    verticalDirection: verticalDirection,
    textBaseline: textBaseline,
    direction: Axis.horizontal,
    divider: divider,
    children: children,
  );

  factory FlintUiFlex.column({
    MainAxisAlignment mainAxisAlignment = .start,
    MainAxisSize mainAxisSize = .max,
    CrossAxisAlignment crossAxisAlignment = .center,
    TextDirection textDirection = .ltr,
    VerticalDirection verticalDirection = .down,
    TextBaseline textBaseline = .alphabetic,
    Widget? divider,
    List<Widget> children = const [],
  }) => FlintUiFlex._(
    mainAxisAlignment: mainAxisAlignment,
    mainAxisSize: mainAxisSize,
    crossAxisAlignment: crossAxisAlignment,
    textDirection: textDirection,
    verticalDirection: verticalDirection,
    textBaseline: textBaseline,
    direction: Axis.vertical,
    divider: divider,
    children: children,
  );

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline textBaseline;
  final Axis direction;
  final Widget? divider;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final divider = this.divider ?? DefaultFlintUiFlexDivider.maybeOf(context)?.divider;

    return Flex(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      direction: direction,
      children: children
          .expand(
            (child) => [
              child,
              if (divider != null && child != children.last) divider,
            ],
          )
          .toList(),
    );
  }
}
