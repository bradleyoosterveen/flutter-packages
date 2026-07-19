part of 'theme_data.dart';

extension LightTheme on FlintUiThemeData {
  static FlintUiThemeData _data(BuildContext context) {
    final baseTextColor = FlintUiColors.black;

    return FlintUiThemeData._(
      brightness: .light,
      spacing: FlintUiThemeData._spacing,
      buttonStyles: .new(
        primary: .new(
          backgroundColor: FlintUiColors.black,
          foregroundColor: FlintUiColors.white,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
        secondary: .new(
          backgroundColor: FlintUiColors.black.alpha10,
          foregroundColor: FlintUiColors.black,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
        outline: .new(
          backgroundColor: FlintUiColors.transparent,
          foregroundColor: FlintUiColors.black,
          borderColor: FlintUiColors.black.alpha10,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
        ghost: .new(
          backgroundColor: FlintUiColors.transparent,
          foregroundColor: FlintUiColors.black,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseButtonBorderRadius,
        ),
      ),
      cardStyles: .new(
        filled: .new(
          backgroundColor: FlintUiColors.black.alpha05,
          borderColor: FlintUiColors.transparent,
          borderRadius: FlintUiThemeData._baseCardBorderRadius,
        ),
        outline: .new(
          backgroundColor: FlintUiColors.transparent,
          borderColor: FlintUiColors.black.alpha20,
          borderRadius: FlintUiThemeData._baseCardBorderRadius,
        ),
      ),
      scaffoldStyles: .new(
        primary: .new(
          backgroundColor: FlintUiColors.white.shade50,
          floatingHeaderBackgroundColor: FlintUiColors.white,
          horizontalInset: FlintUiThemeData._spacing.md,
        ),
      ),
      textStyles: FlintUiThemeData._coloredTextStyles(
        FlintUiThemeData._baseTextStyles(),
        baseTextColor,
      ),
      alertStyles: .new(
        info: .new(
          backgroundColor: FlintUiColors.blue.shade100,
          borderColor: FlintUiColors.blue.shade700,
          foregroundColor: FlintUiColors.blue.shade700,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
        success: .new(
          backgroundColor: FlintUiColors.green.shade100,
          borderColor: FlintUiColors.green.shade700,
          foregroundColor: FlintUiColors.green.shade700,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
        warning: .new(
          backgroundColor: FlintUiColors.orange.shade100,
          borderColor: FlintUiColors.orange.shade700,
          foregroundColor: FlintUiColors.orange.shade700,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
        error: .new(
          backgroundColor: FlintUiColors.red.shade100,
          borderColor: FlintUiColors.red.shade700,
          foregroundColor: FlintUiColors.red.shade700,
          borderRadius: FlintUiThemeData._baseAlertBorderRadius,
        ),
      ),
      iconStyles: .new(),
      fieldStyles: .new(
        primary: .new(
          backgroundColor: FlintUiColors.black.alpha05,
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
          inactiveForegroundColor: FlintUiColors.black,
        ),
      ),
    );
  }
}
