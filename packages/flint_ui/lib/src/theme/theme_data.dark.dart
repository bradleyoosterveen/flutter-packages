part of 'theme_data.dart';

extension DarkTheme on FlintUiThemeData {
  static FlintUiThemeData _data(BuildContext context) {
    final baseTextColor = FlintUiColors.white;

    return FlintUiThemeData._(
      brightness: .dark,
      spacing: FlintUiThemeData._spacing,
      buttonStyles: .new(
        primary: .new(
          backgroundColor: FlintUiColors.white,
          foregroundColor: FlintUiColors.black,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
        secondary: .new(
          backgroundColor: FlintUiColors.white.alpha10,
          foregroundColor: FlintUiColors.white,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
        outline: .new(
          backgroundColor: FlintUiColors.transparent,
          foregroundColor: FlintUiColors.white,
          borderColor: FlintUiColors.white.alpha10,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
        ghost: .new(
          backgroundColor: FlintUiColors.transparent,
          foregroundColor: FlintUiColors.white,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
      ),
      cardStyles: .new(
        filled: .new(
          backgroundColor: FlintUiColors.white.alpha05,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseCardBorderRadius,
        ),
        outline: .new(
          backgroundColor: FlintUiColors.transparent,
          borderColor: FlintUiColors.white.alpha20,
          borderRadius: FlintUiThemeData._baseCardBorderRadius,
        ),
      ),
      scaffoldStyles: .new(
        primary: .new(
          backgroundColor: FlintUiColors.black.shade950,
          floatingHeaderBackgroundColor: FlintUiColors.black,
          horizontalInset: FlintUiThemeData._spacing.md,
        ),
      ),
      textStyles: FlintUiThemeData._coloredTextStyles(
        FlintUiThemeData._baseTextStyles(),
        baseTextColor,
      ),
      alertStyles: .new(
        info: .new(
          backgroundColor: FlintUiColors.blue.shade900,
          borderColor: FlintUiColors.blue.shade300,
          foregroundColor: FlintUiColors.blue.shade300,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
        success: .new(
          backgroundColor: FlintUiColors.green.shade900,
          borderColor: FlintUiColors.green.shade300,
          foregroundColor: FlintUiColors.green.shade300,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
        warning: .new(
          backgroundColor: FlintUiColors.orange.shade900,
          borderColor: FlintUiColors.orange.shade300,
          foregroundColor: FlintUiColors.orange.shade300,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
        error: .new(
          backgroundColor: FlintUiColors.red.shade900,
          borderColor: FlintUiColors.red.shade300,
          foregroundColor: FlintUiColors.red.shade300,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
      ),
      iconStyles: .new(),
      fieldStyles: .new(
        primary: .new(
          backgroundColor: FlintUiColors.white.alpha05,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseFieldBorderRadius,
        ),
      ),
      bottomNavigationBarStyles: .new(
        primary: .new(
          backgroundColor: FlintUiColors.black,
          borderColor: FlintUiColors.white.alpha10,
          borderRadius: FlintUiThemeData._baseBottomNavigationBarBorderRadius,
        ),
      ),
      bottomNavigationBarItemStyles: .new(
        primary: .new(
          activeBackgroundColor: FlintUiColors.white,
          inactiveBackgroundColor: FlintUiColors.transparent,
          activeForegroundColor: FlintUiColors.black,
          inactiveForegroundColor: FlintUiColors.white,
        ),
      ),
    );
  }
}
