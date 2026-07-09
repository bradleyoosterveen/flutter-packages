import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flint_ui/flint_ui.dart';

part 'button.style.dart';

class FlintUiButton extends StatefulWidget {
  static FlintUiButtonStyle _defaultStyleBuilder(FlintUiButtonStyle style) => style;

  const FlintUiButton._({
    required this.child,
    required this.style,
    required this.size,
    required this.onPressed,
    required this.isDisabled,
    required this.isLoading,
    required this.isSquare,
    required this.fit,
    super.key,
  });

  factory FlintUiButton({
    required Widget child,
    FlintUiButtonStyle Function(FlintUiButtonStyle style) style = _defaultStyleBuilder,
    FlintUiButtonSize size = .medium,
    VoidCallback? onPressed,
    bool isDisabled = false,
    bool isLoading = false,
    BoxFit? fit,
    Key? key,
  }) => FlintUiButton._(
    style: style,
    size: size,
    onPressed: onPressed,
    isDisabled: isDisabled,
    isLoading: isLoading,
    fit: fit,
    isSquare: false,
    key: key,
    child: child,
  );

  factory FlintUiButton.square({
    required Widget child,
    FlintUiButtonStyle Function(FlintUiButtonStyle style) style = _defaultStyleBuilder,
    FlintUiButtonSize size = .medium,
    VoidCallback? onPressed,
    bool isDisabled = false,
    bool isLoading = false,
    BoxFit? fit,
    Key? key,
  }) => FlintUiButton._(
    style: style,
    size: size,
    onPressed: onPressed,
    isDisabled: isDisabled,
    isLoading: isLoading,
    isSquare: true,
    fit: fit,
    key: key,
    child: child,
  );

  final Widget child;
  final FlintUiButtonStyle Function(FlintUiButtonStyle style) style;
  final FlintUiButtonSize size;
  final VoidCallback? onPressed;
  final bool isDisabled;
  final bool isLoading;
  final bool isSquare;
  final BoxFit? fit;

  @override
  State<FlintUiButton> createState() => _FlintUiButtonState();
}

class _FlintUiButtonState extends State<FlintUiButton> {
  DateTime _lastPressed = DateTime.now();

  Duration get _animationDuration => const Duration(milliseconds: 600);

  Curve get _animationCurve => Curves.easeOutExpo;

  bool get _isDisabled => widget.isDisabled || widget.isLoading ? true : widget.onPressed == null;

  double get _opacity => _isDisabled ? 0.24 : 1;

  double get _height => switch (widget.size) {
    .small => context.themeData.spacing.xl,
    .medium => context.themeData.spacing.xxl,
    .large => context.themeData.spacing.xxxl,
  };

  double? get _width => widget.isSquare ? _height : null;

  double get _horizontalPadding => widget.isSquare
      ? 0
      : switch (widget.size) {
          .small => context.themeData.spacing.sm,
          .medium => context.themeData.spacing.md,
          .large => context.themeData.spacing.lg,
        };

  FlintUiTextStyle get _textStyle => switch (widget.size) {
    .small => context.themeData.textStyles.titleSmall,
    .medium => context.themeData.textStyles.titleMedium,
    .large => context.themeData.textStyles.titleLarge,
  };

  void _handleOnTap() async {
    if (_isDisabled) return;

    if (widget.onPressed == null) return;

    final now = DateTime.now();

    if (now.millisecondsSinceEpoch - _lastPressed.millisecondsSinceEpoch < Duration(milliseconds: 300).inMilliseconds) {
      return;
    }

    _lastPressed = now;

    widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = widget.style(DefaultFlintUiButtonStyle.of(context));

    final defaultTextStyle = _textStyle.copyWith(
      color: resolvedStyle.foregroundColor,
    );

    return DefaultFlintUiTextStyle(
      style: defaultTextStyle,
      child: DefaultFlintUiIconStyle(
        style: context.themeData.iconStyles.fromTextStyle(defaultTextStyle),
        child: DefaultFlintUiFlexDivider(
          divider: FlintUiGap.row(context.themeData.spacing.xs),
          child: AnimatedOpacity(
            duration: _animationDuration,
            curve: _animationCurve,
            opacity: _opacity,
            child: AnimatedContainer(
              duration: _animationDuration,
              curve: _animationCurve,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: resolvedStyle.backgroundColor.color,
                borderRadius: .circular(resolvedStyle.borderRadius),
                border: .all(
                  color: resolvedStyle.borderColor.color,
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _handleOnTap,
                child: Align(
                  alignment: Alignment.center,
                  widthFactor: 1,
                  child: Padding(
                    padding: .symmetric(
                      horizontal: widget.fit != null ? 0 : _horizontalPadding,
                    ),
                    child: FlintUiFlex.column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: .center,
                      children: [
                        _animatedAlignWrapper(
                          child: widget.child,
                          fit: widget.fit,
                          heightFactor: widget.isLoading ? 0 : 1,
                          alignment: Alignment.bottomCenter,
                        ),
                        _animatedAlignWrapper(
                          child: Align(
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(
                                defaultTextStyle.fontSize / 2,
                              ),
                              child: FlintUiIcon.loaderCircle()
                                  .animate(
                                    onPlay: (controller) => controller.repeat(),
                                  )
                                  .rotate(
                                    duration: Duration(milliseconds: 900),
                                  ),
                            ),
                          ),
                          heightFactor: widget.isLoading ? 1 : 0,
                          alignment: Alignment.topCenter,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _animatedAlignWrapper({
    required Widget child,
    required double heightFactor,
    required Alignment alignment,
    BoxFit? fit,
  }) => ClipRect(
    child: AnimatedAlign(
      duration: _animationDuration,
      heightFactor: heightFactor,
      curve: _animationCurve,
      alignment: alignment,
      child: SizedBox(
        height: _height,
        width: _width,
        child: fit != null ? FittedBox(fit: fit, child: child) : Center(child: child),
      ),
    ),
  );
}

enum FlintUiButtonSize { small, medium, large }
