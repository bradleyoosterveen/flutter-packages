part of 'theme_data.dart';

extension DarkTheme on FlintUiThemeData {
  static FlintUiThemeData _data(BuildContext context) {
    final baseTextColor = FlintUiColors.white;

    return FlintUiThemeData._(
      brightness: .dark,
      spacing: FlintUiThemeData._spacing,
      buttonStyles: FlintUiButtonStyles(
        primary: FlintUiButtonStyle(
          backgroundColor: FlintUiColors.white,
          foregroundColor: FlintUiColors.black,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
        secondary: FlintUiButtonStyle(
          backgroundColor: FlintUiColors.white.alpha10,
          foregroundColor: FlintUiColors.white,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
        outline: FlintUiButtonStyle(
          backgroundColor: FlintUiColors.transparent,
          foregroundColor: FlintUiColors.white,
          borderColor: FlintUiColors.white.alpha10,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
        ghost: FlintUiButtonStyle(
          backgroundColor: FlintUiColors.transparent,
          foregroundColor: FlintUiColors.white,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
      ),
      cardStyles: FlintUiCardStyles(
        filled: FlintUiCardStyle(
          backgroundColor: FlintUiColors.white.alpha05,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseCardBorderRadius,
        ),
        outline: FlintUiCardStyle(
          backgroundColor: FlintUiColors.transparent,
          borderColor: FlintUiColors.white.alpha20,
          borderRadius: FlintUiThemeData._baseCardBorderRadius,
        ),
      ),
      scaffoldStyles: FlintUiScaffoldStyles(
        primary: FlintUiScaffoldStyle(
          backgroundColor: FlintUiColors.black.shade950,
          floatingHeaderBackgroundColor: FlintUiColors.black,
          horizontalInset: FlintUiThemeData._spacing.md,
        ),
      ),
      textStyles: FlintUiThemeData._coloredTextStyles(
        FlintUiThemeData._baseTextStyles(),
        baseTextColor,
      ),
      alertStyles: FlintUiAlertStyles(
        info: FlintUiAlertStyle(
          backgroundColor: FlintUiColors.blue.shade900,
          borderColor: FlintUiColors.blue.shade300,
          foregroundColor: FlintUiColors.blue.shade300,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
        success: FlintUiAlertStyle(
          backgroundColor: FlintUiColors.green.shade900,
          borderColor: FlintUiColors.green.shade300,
          foregroundColor: FlintUiColors.green.shade300,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
        warning: FlintUiAlertStyle(
          backgroundColor: FlintUiColors.orange.shade900,
          borderColor: FlintUiColors.orange.shade300,
          foregroundColor: FlintUiColors.orange.shade300,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
        error: FlintUiAlertStyle(
          backgroundColor: FlintUiColors.red.shade900,
          borderColor: FlintUiColors.red.shade300,
          foregroundColor: FlintUiColors.red.shade300,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
      ),
      iconStyles: FlintUiIconStyles(),
      fieldStyles: FlintUiFieldStyles(
        primary: FlintUiFieldStyle(
          backgroundColor: FlintUiColors.white.alpha05,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseFieldBorderRadius,
        ),
      ),
      bottomNavigationBarStyles: FlintUiBottomNavigationBarStyles(
        primary: FlintUiBottomNavigationBarStyle(
          backgroundColor: FlintUiColors.black,
          borderColor: FlintUiColors.white.alpha10,
          borderRadius: FlintUiThemeData._baseBottomNavigationBarBorderRadius,
        ),
      ),
      bottomNavigationBarItemStyles: FlintUiBottomNavigationBarItemStyles(
        primary: FlintUiBottomNavigationBarItemStyle(
          activeBackgroundColor: FlintUiColors.white,
          inactiveBackgroundColor: FlintUiColors.transparent,
          activeForegroundColor: FlintUiColors.black,
          inactiveForegroundColor: FlintUiColors.white,
        ),
      ),
    );
  }
}
