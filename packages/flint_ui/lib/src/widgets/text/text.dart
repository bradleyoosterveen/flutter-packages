import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

part 'text.style.dart';

class FlintUiText extends StatelessWidget {
  static FlintUiTextStyle _defaultStyleBuilder(FlintUiTextStyle style) => style;

  const FlintUiText(this.text, {this.style = _defaultStyleBuilder, super.key});

  final String text;
  final FlintUiTextStyle Function(FlintUiTextStyle style) style;

  FlintUiText dim() => .new(
    text,
    style: (s) => style(s).copyWith(color: style(s).color.alpha50),
  );

  FlintUiText centered() => .new(text, style: (s) => style(s).copyWith(textAlign: .center));

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = style(DefaultFlintUiTextStyle.of(context));

    final resolvedText = resolvedStyle.uppercase ? text.toUpperCase() : text;

    return Text(
      resolvedText,
      style: resolvedStyle.toTextStyle(),
      textAlign: resolvedStyle.textAlign,
      maxLines: resolvedStyle.maxLines,
    );
  }
}
