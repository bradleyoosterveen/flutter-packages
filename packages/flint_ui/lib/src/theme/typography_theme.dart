import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

class FlintUiTypographyThemeData {
  static final String _fontFamily = 'packages/ui/WorkSans';

  static final TextStyle _baseTextStyle = TextStyle(
    fontFamily: _fontFamily,
    decoration: TextDecoration.none,
    decorationThickness: 0.0,
  );

  final FlintUiColor baseColor;
  final TextStyle display;
  final TextStyle headline;
  final TextStyle title;
  final TextStyle body;
  final TextStyle label;

  const FlintUiTypographyThemeData({
    required this.baseColor,
    required this.display,
    required this.headline,
    required this.title,
    required this.body,
    required this.label,
  });

  factory FlintUiTypographyThemeData.base({required FlintUiColor baseColor}) => FlintUiTypographyThemeData(
    baseColor: baseColor,
    display: _baseTextStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: baseColor.color,
    ),
    headline: _baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: baseColor.color,
    ),
    title: _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: baseColor.color,
    ),
    body: _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: baseColor.color,
    ),
    label: _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: baseColor.color,
    ),
  );
}
