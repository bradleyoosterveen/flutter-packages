part of 'theme_data.dart';

extension LightTheme on FlintUiThemeData {
  static FlintUiThemeData _data(BuildContext context) {
    final baseTextColor = FlintUiColors.black;

    return FlintUiThemeData._(
      brightness: .light,
      spacing: FlintUiThemeData._spacing,
      buttonStyles: FlintUiButtonStyles(
        primary: FlintUiButtonStyle(
          backgroundColor: FlintUiColors.black,
          foregroundColor: FlintUiColors.white,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
        secondary: FlintUiButtonStyle(
          backgroundColor: FlintUiColors.black.alpha10,
          foregroundColor: FlintUiColors.black,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
        outline: FlintUiButtonStyle(
          backgroundColor: FlintUiColors.transparent,
          foregroundColor: FlintUiColors.black,
          borderColor: FlintUiColors.black.alpha10,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
        ghost: FlintUiButtonStyle(
          backgroundColor: FlintUiColors.transparent,
          foregroundColor: FlintUiColors.black,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
      ),
      cardStyles: FlintUiCardStyles(
        filled: FlintUiCardStyle(
          backgroundColor: FlintUiColors.black.alpha05,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseCardBorderRadius,
        ),
        outline: FlintUiCardStyle(
          backgroundColor: FlintUiColors.transparent,
          borderColor: FlintUiColors.black.alpha20,
          borderRadius: FlintUiThemeData._baseCardBorderRadius,
        ),
      ),
      scaffoldStyles: FlintUiScaffoldStyles(
        primary: FlintUiScaffoldStyle(
          backgroundColor: FlintUiColors.white.shade50,
          floatingHeaderBackgroundColor: FlintUiColors.white,
          horizontalInset: FlintUiThemeData._spacing.md,
        ),
      ),
      textStyles: FlintUiThemeData._coloredTextStyles(
        FlintUiThemeData._baseTextStyles(),
        baseTextColor,
      ),
      alertStyles: FlintUiAlertStyles(
        info: FlintUiAlertStyle(
          backgroundColor: FlintUiColors.blue.shade100,
          borderColor: FlintUiColors.blue.shade700,
          foregroundColor: FlintUiColors.blue.shade700,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
        success: FlintUiAlertStyle(
          backgroundColor: FlintUiColors.green.shade100,
          borderColor: FlintUiColors.green.shade700,
          foregroundColor: FlintUiColors.green.shade700,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
        warning: FlintUiAlertStyle(
          backgroundColor: FlintUiColors.orange.shade100,
          borderColor: FlintUiColors.orange.shade700,
          foregroundColor: FlintUiColors.orange.shade700,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
        error: FlintUiAlertStyle(
          backgroundColor: FlintUiColors.red.shade100,
          borderColor: FlintUiColors.red.shade700,
          foregroundColor: FlintUiColors.red.shade700,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
      ),
      iconStyles: FlintUiIconStyles(),
      fieldStyles: FlintUiFieldStyles(
        primary: FlintUiFieldStyle(
          backgroundColor: FlintUiColors.black.alpha05,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseFieldBorderRadius,
        ),
      ),
      bottomNavigationBarStyles: FlintUiBottomNavigationBarStyles(
        primary: FlintUiBottomNavigationBarStyle(
          backgroundColor: FlintUiColors.white,
          borderColor: FlintUiColors.white.alpha10,
          borderRadius: FlintUiThemeData._baseBottomNavigationBarBorderRadius,
        ),
      ),
      bottomNavigationBarItemStyles: FlintUiBottomNavigationBarItemStyles(
        primary: FlintUiBottomNavigationBarItemStyle(
          activeBackgroundColor: FlintUiColors.white,
          inactiveBackgroundColor: FlintUiColors.transparent,
          activeForegroundColor: FlintUiColors.black,
          inactiveForegroundColor: FlintUiColors.black,
        ),
      ),
    );
  }
}
