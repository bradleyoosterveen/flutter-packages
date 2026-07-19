import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'theme_data.dark.dart';
part 'theme_data.light.dart';

class FlintUiThemeData with Diagnosticable {
  static final FlintUiSpacing _spacing = FlintUiSpacing.base();
  static final double _baseButtonBorderRadius = 99;
  static final double _baseCardBorderRadius = 16;
  static final String _baseFontFamily = 'packages/flint_ui/WorkSans';

  static FlintUiTextStyle _baseTextStyle() => FlintUiTextStyle(
    fontFamily: _baseFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: FlintUiColors.transparent,
    uppercase: false,
    textAlign: .left,
    overflow: .visible,
    maxLines: null,
  );

  static FlintUiTextStyles _baseTextStyles() => FlintUiTextStyles(
    displayLarge: _baseTextStyle().copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w900,
      uppercase: true,
    ),
    displayMedium: _baseTextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      uppercase: true,
    ),
    displaySmall: _baseTextStyle().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w900,
      uppercase: true,
    ),
    headlineLarge: _baseTextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: _baseTextStyle().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: _baseTextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: _baseTextStyle().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: _baseTextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: _baseTextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: _baseTextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: _baseTextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: _baseTextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: _baseTextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: _baseTextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: _baseTextStyle().copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w500,
    ),
  );

  static FlintUiTextStyles _coloredTextStyles(
    FlintUiTextStyles baseStyles,
    FlintUiColor baseTextColor,
  ) => baseStyles.copyWith(
    displayLarge: baseStyles.displayLarge.copyWith(color: baseTextColor),
    displayMedium: baseStyles.displayMedium.copyWith(color: baseTextColor),
    displaySmall: baseStyles.displaySmall.copyWith(color: baseTextColor),
    headlineLarge: baseStyles.headlineLarge.copyWith(color: baseTextColor),
    headlineMedium: baseStyles.headlineMedium.copyWith(color: baseTextColor),
    headlineSmall: baseStyles.headlineSmall.copyWith(color: baseTextColor),
    titleLarge: baseStyles.titleLarge.copyWith(color: baseTextColor),
    titleMedium: baseStyles.titleMedium.copyWith(color: baseTextColor),
    titleSmall: baseStyles.titleSmall.copyWith(color: baseTextColor),
    bodyLarge: baseStyles.bodyLarge.copyWith(color: baseTextColor.alpha80),
    bodyMedium: baseStyles.bodyMedium.copyWith(color: baseTextColor.alpha80),
    bodySmall: baseStyles.bodySmall.copyWith(color: baseTextColor.alpha80),
    labelLarge: baseStyles.labelLarge.copyWith(color: baseTextColor),
    labelMedium: baseStyles.labelMedium.copyWith(color: baseTextColor),
    labelSmall: baseStyles.labelSmall.copyWith(color: baseTextColor),
  );
  static final double _baseAlertBorderRadius = 8;
  static final double _baseFieldBorderRadius = 16;
  static final double _baseBottomNavigationBarBorderRadius = 99;

  final Brightness brightness;
  final FlintUiSpacing spacing;
  final FlintUiButtonStyles buttonStyles;
  final FlintUiCardStyles cardStyles;
  final FlintUiScaffoldStyles scaffoldStyles;
  final FlintUiTextStyles textStyles;
  final FlintUiAlertStyles alertStyles;
  final FlintUiIconStyles iconStyles;
  final FlintUiFieldStyles fieldStyles;
  final FlintUiBottomNavigationBarStyles bottomNavigationBarStyles;
  final FlintUiBottomNavigationBarItemStyles bottomNavigationBarItemStyles;

  const FlintUiThemeData._({
    required this.brightness,
    required this.spacing,
    required this.buttonStyles,
    required this.cardStyles,
    required this.scaffoldStyles,
    required this.textStyles,
    required this.alertStyles,
    required this.iconStyles,
    required this.fieldStyles,
    required this.bottomNavigationBarStyles,
    required this.bottomNavigationBarItemStyles,
  });

  factory FlintUiThemeData.fromPlatformBrightness(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    return switch (brightness) {
      .light => LightTheme._data(context),
      .dark => DarkTheme._data(context),
    };
  }

  factory FlintUiThemeData.fromBrightness(BuildContext context, Brightness brightness) => switch (brightness) {
    .light => LightTheme._data(context),
    .dark => DarkTheme._data(context),
  };

  ThemeData toMaterialTheme() => ThemeData(
    useMaterial3: true,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {.android: FadeForwardsPageTransitionsBuilder()},
    ),
    colorScheme: ColorScheme.dark(
      surface: scaffoldStyles.primary.backgroundColor.color,
      primary: textStyles.bodyMedium.color.color,
    ),
  );
}
