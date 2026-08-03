import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

part 'field.style.dart';

class FlintUiField extends StatefulWidget {
  static FlintUiFieldStyle _defaultStyleBuilder(FlintUiFieldStyle style) => style;

  const FlintUiField._({
    required this.controller,
    required this.style,
    required this.focusNode,
    required this.placeholderText,
    required this.prefix,
    required this.suffix,
    this.hasError = false,
    this.obscure = false,
    this.minLines = 1,
    this.maxLines = 1,
    super.key,
  });

  factory FlintUiField.text({
    TextEditingController? controller,
    FlintUiFieldStyle Function(FlintUiFieldStyle style) style = _defaultStyleBuilder,
    FocusNode? focusNode,
    bool hasError = false,
    String? placeholderText,
    String? textInputType,
    Widget? prefix,
    Widget? suffix,
    Key? key,
  }) => FlintUiField._(
    controller: controller,
    style: style,
    focusNode: focusNode,
    hasError: hasError,
    obscure: false,
    placeholderText: placeholderText,
    prefix: prefix,
    suffix: suffix,
    key: key,
  );

  factory FlintUiField.multiline({
    TextEditingController? controller,
    FlintUiFieldStyle Function(FlintUiFieldStyle style) style = _defaultStyleBuilder,
    FocusNode? focusNode,
    bool hasError = false,
    String? placeholderText,
    Key? key,
  }) => FlintUiField._(
    controller: controller,
    style: style,
    focusNode: focusNode,
    placeholderText: placeholderText,
    prefix: null,
    suffix: null,
    hasError: hasError,
    obscure: false,
    minLines: 2,
    maxLines: null,
    key: key,
  );

  factory FlintUiField.password({
    TextEditingController? controller,
    FlintUiFieldStyle Function(FlintUiFieldStyle style) style = _defaultStyleBuilder,
    FocusNode? focusNode,
    bool hasError = false,
    String? placeholderText,
    Widget? prefix,
    Widget? suffix,
    Key? key,
  }) => FlintUiField._(
    controller: controller,
    style: style,
    focusNode: focusNode,
    hasError: hasError,
    obscure: true,
    placeholderText: placeholderText,
    prefix: prefix,
    suffix: suffix,
    key: key,
  );

  final TextEditingController? controller;
  final FlintUiFieldStyle Function(FlintUiFieldStyle style) style;
  final FocusNode? focusNode;
  final bool hasError;
  final bool obscure;
  final String? placeholderText;
  final int? minLines;
  final int? maxLines;
  final Widget? prefix;
  final Widget? suffix;

  @override
  State<FlintUiField> createState() => _FlintUiFieldState();
}

class _FlintUiFieldState extends State<FlintUiField> {
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Curve _animationCurve = Curves.easeInOutCubic;
  final String _obscureCharacter = '•';

  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();

  EdgeInsetsGeometry _contentPadding(BuildContext context) =>
      EdgeInsetsGeometry.symmetric(
        vertical: context.themeData.spacing.md,
      ).add(
        .only(
          left: widget.prefix == null ? context.themeData.spacing.sm : 0,
          right: widget.suffix == null ? context.themeData.spacing.sm : 0,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = widget.style(DefaultFlintUiFieldStyle.of(context));
    final borderColor = widget.hasError ? FlintUiColors.orange : resolvedStyle.borderColor;

    final prefixWidget = widget.prefix;
    final suffixWidget = widget.suffix;

    return AnimatedContainer(
      duration: _animationDuration,
      curve: _animationCurve,
      decoration: BoxDecoration(
        color: resolvedStyle.backgroundColor.color,
        borderRadius: .circular(
          resolvedStyle.borderRadius,
        ),
        border: .all(width: 1, color: borderColor.color),
      ),
      child: Padding(
        padding: .symmetric(
          horizontal: context.themeData.spacing.sm,
        ),
        child: FlintUiFlex.row(
          crossAxisAlignment: .center,
          divider: FlintUiGap.row(context.themeData.spacing.sm),
          children: [
            if (prefixWidget != null) ...[
              _defaultFlexDivider(
                context: context,
                child: prefixWidget,
              ),
            ],
            Expanded(
              child: IntrinsicHeight(
                child: TextField(
                  minLines: widget.minLines,
                  maxLines: widget.maxLines,
                  obscureText: widget.obscure,
                  obscuringCharacter: _obscureCharacter,
                  focusNode: _focusNode,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    contentPadding: _contentPadding(context),
                    hintText: widget.placeholderText,
                    border: InputBorder.none,
                    hintStyle: context.themeData.textStyles.bodyMedium
                        .copyWith(
                          color: context.themeData.textStyles.bodyMedium.color.alpha50,
                        )
                        .toTextStyle(),
                  ),
                  style: context.themeData.textStyles.labelLarge.toTextStyle(),
                  textAlignVertical: .top,
                  textAlign: .start,
                  onTapOutside: (_) => _focusNode.unfocus(),
                ),
              ),
            ),
            if (suffixWidget != null) ...[
              _defaultFlexDivider(
                context: context,
                child: suffixWidget,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _defaultFlexDivider({required BuildContext context, required Widget child}) => DefaultFlintUiFlexDivider(
    divider: FlintUiGap.row(context.themeData.spacing.xxs),
    child: child,
  );
}
