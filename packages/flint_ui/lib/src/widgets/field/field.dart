import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

part 'field.style.dart';

class FlintUiField extends StatefulWidget {
  const FlintUiField._({
    this.controller,
    this.focusNode,
    this.hasError = false,
    this.obscure = false,
    this.placeholderText,
    this.minLines = 1,
    this.maxLines = 1,
    super.key,
  });

  factory FlintUiField.text({
    TextEditingController? controller,
    FocusNode? focusNode,
    bool hasError = false,
    String? placeholderText,
    String? textInputType,
    Key? key,
  }) => FlintUiField._(
    controller: controller,
    focusNode: focusNode,
    hasError: hasError,
    obscure: false,
    placeholderText: placeholderText,
    key: key,
  );

  factory FlintUiField.multiline({
    TextEditingController? controller,
    FocusNode? focusNode,
    bool hasError = false,
    String? placeholderText,
    Key? key,
  }) => FlintUiField._(
    controller: controller,
    focusNode: focusNode,
    hasError: hasError,
    obscure: false,
    placeholderText: placeholderText,
    minLines: 2,
    maxLines: null,
    key: key,
  );

  factory FlintUiField.password({
    TextEditingController? controller,
    FocusNode? focusNode,
    bool hasError = false,
    String? placeholderText,
    Key? key,
  }) => FlintUiField._(
    controller: controller,
    focusNode: focusNode,
    hasError: hasError,
    obscure: true,
    placeholderText: placeholderText,
    key: key,
  );

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool hasError;
  final bool obscure;
  final String? placeholderText;
  final int? minLines;
  final int? maxLines;

  @override
  State<FlintUiField> createState() => _FlintUiFieldState();
}

class _FlintUiFieldState extends State<FlintUiField> {
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Curve _animationCurve = Curves.easeInOutCubic;
  final String _obscureCharacter = '•';

  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();

  FlintUiColor get _borderColor =>
      widget.hasError ? FlintUiColors.orange : context.themeData.fieldStyles.primary.borderColor;

  @override
  Widget build(BuildContext context) => _field();

  Widget _field() => AnimatedContainer(
    duration: _animationDuration,
    curve: _animationCurve,
    decoration: BoxDecoration(
      color: context.themeData.fieldStyles.primary.backgroundColor.color,
      borderRadius: .circular(
        context.themeData.fieldStyles.primary.borderRadius,
      ),
      border: .all(width: 1, color: _borderColor.color),
    ),
    child: FlintUiFlex.row(
      children: [
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
                contentPadding: .symmetric(
                  horizontal: context.themeData.spacing.lg,
                  vertical: context.themeData.spacing.md,
                ),
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
      ],
    ),
  );
}
