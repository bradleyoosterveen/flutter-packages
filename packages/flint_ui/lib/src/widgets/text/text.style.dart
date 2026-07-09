part of 'text.dart';

class DefaultFlintUiTextStyle extends InheritedWidget {
  const DefaultFlintUiTextStyle({
    super.key,
    required this.style,
    required super.child,
  });

  final FlintUiTextStyle style;

  static FlintUiTextStyle of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DefaultFlintUiTextStyle>()?.style ??
      context.themeData.textStyles.bodyMedium;

  @override
  bool updateShouldNotify(covariant DefaultFlintUiTextStyle oldWidget) => !(style == oldWidget.style);
}

class FlintUiTextStyle {
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final FlintUiColor color;
  final bool uppercase;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  FlintUiTextStyle({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.uppercase,
    required this.textAlign,
    required this.overflow,
    required this.maxLines,
  });

  TextStyle toTextStyle() => TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color.color,
    decoration: TextDecoration.none,
    decorationThickness: 0.0,
    overflow: overflow,
  );

  FlintUiTextStyle copyWith({
    String? fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
    FlintUiColor? color,
    bool? uppercase,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) => FlintUiTextStyle(
    fontFamily: fontFamily ?? this.fontFamily,
    fontSize: fontSize ?? this.fontSize,
    fontWeight: fontWeight ?? this.fontWeight,
    color: color ?? this.color,
    uppercase: uppercase ?? this.uppercase,
    textAlign: textAlign ?? this.textAlign,
    overflow: overflow ?? this.overflow,
    maxLines: maxLines ?? this.maxLines,
  );
}

class FlintUiTextStyles {
  final FlintUiTextStyle displayLarge;
  final FlintUiTextStyle displayMedium;
  final FlintUiTextStyle displaySmall;
  final FlintUiTextStyle headlineLarge;
  final FlintUiTextStyle headlineMedium;
  final FlintUiTextStyle headlineSmall;
  final FlintUiTextStyle titleLarge;
  final FlintUiTextStyle titleMedium;
  final FlintUiTextStyle titleSmall;
  final FlintUiTextStyle bodyLarge;
  final FlintUiTextStyle bodyMedium;
  final FlintUiTextStyle bodySmall;
  final FlintUiTextStyle labelLarge;
  final FlintUiTextStyle labelMedium;
  final FlintUiTextStyle labelSmall;

  const FlintUiTextStyles({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
  });

  FlintUiTextStyles copyWith({
    FlintUiTextStyle? displayLarge,
    FlintUiTextStyle? displayMedium,
    FlintUiTextStyle? displaySmall,
    FlintUiTextStyle? headlineLarge,
    FlintUiTextStyle? headlineMedium,
    FlintUiTextStyle? headlineSmall,
    FlintUiTextStyle? titleLarge,
    FlintUiTextStyle? titleMedium,
    FlintUiTextStyle? titleSmall,
    FlintUiTextStyle? bodyLarge,
    FlintUiTextStyle? bodyMedium,
    FlintUiTextStyle? bodySmall,
    FlintUiTextStyle? labelLarge,
    FlintUiTextStyle? labelMedium,
    FlintUiTextStyle? labelSmall,
  }) => FlintUiTextStyles(
    displayLarge: displayLarge ?? this.displayLarge,
    displayMedium: displayMedium ?? this.displayMedium,
    displaySmall: displaySmall ?? this.displaySmall,
    headlineLarge: headlineLarge ?? this.headlineLarge,
    headlineMedium: headlineMedium ?? this.headlineMedium,
    headlineSmall: headlineSmall ?? this.headlineSmall,
    titleLarge: titleLarge ?? this.titleLarge,
    titleMedium: titleMedium ?? this.titleMedium,
    titleSmall: titleSmall ?? this.titleSmall,
    bodyLarge: bodyLarge ?? this.bodyLarge,
    bodyMedium: bodyMedium ?? this.bodyMedium,
    bodySmall: bodySmall ?? this.bodySmall,
    labelLarge: labelLarge ?? this.labelLarge,
    labelMedium: labelMedium ?? this.labelMedium,
    labelSmall: labelSmall ?? this.labelSmall,
  );
}
