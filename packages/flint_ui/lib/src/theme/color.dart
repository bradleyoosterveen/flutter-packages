import 'package:flutter/painting.dart';

class FlintUiColor {
  final HSLColor _hslColor;

  const FlintUiColor(this._hslColor);

  Color get color => _hslColor.toColor();

  HSLColor get hslColor => _hslColor;

  FlintUiColor get shade25 => FlintUiColor(_hslColor.withLightness(0.975));
  FlintUiColor get shade50 => FlintUiColor(_hslColor.withLightness(0.95));

  FlintUiColor get shade100 => FlintUiColor(_hslColor.withLightness(0.90));

  FlintUiColor get shade200 => FlintUiColor(_hslColor.withLightness(0.80));

  FlintUiColor get shade300 => FlintUiColor(_hslColor.withLightness(0.70));

  FlintUiColor get shade400 => FlintUiColor(_hslColor.withLightness(0.60));

  FlintUiColor get shade500 => FlintUiColor(_hslColor);

  FlintUiColor get shade600 => FlintUiColor(_hslColor.withLightness(0.40));

  FlintUiColor get shade700 => FlintUiColor(_hslColor.withLightness(0.30));

  FlintUiColor get shade800 => FlintUiColor(_hslColor.withLightness(0.20));

  FlintUiColor get shade900 => FlintUiColor(_hslColor.withLightness(0.10));

  FlintUiColor get shade950 => FlintUiColor(_hslColor.withLightness(0.05));
  FlintUiColor get shade975 => FlintUiColor(_hslColor.withLightness(0.025));

  FlintUiColor get alpha05 => FlintUiColor(_hslColor.withAlpha(0.05));

  FlintUiColor get alpha10 => FlintUiColor(_hslColor.withAlpha(0.10));

  FlintUiColor get alpha20 => FlintUiColor(_hslColor.withAlpha(0.20));

  FlintUiColor get alpha30 => FlintUiColor(_hslColor.withAlpha(0.30));

  FlintUiColor get alpha40 => FlintUiColor(_hslColor.withAlpha(0.40));

  FlintUiColor get alpha50 => FlintUiColor(_hslColor.withAlpha(0.50));

  FlintUiColor get alpha60 => FlintUiColor(_hslColor.withAlpha(0.60));

  FlintUiColor get alpha70 => FlintUiColor(_hslColor.withAlpha(0.70));

  FlintUiColor get alpha80 => FlintUiColor(_hslColor.withAlpha(0.80));

  FlintUiColor get alpha90 => FlintUiColor(_hslColor.withAlpha(0.90));

  FlintUiColor get alpha95 => FlintUiColor(_hslColor.withAlpha(0.95));

  FlintUiColor get saturation05 => FlintUiColor(_hslColor.withSaturation(0.05));

  FlintUiColor get saturation10 => FlintUiColor(_hslColor.withSaturation(0.10));

  FlintUiColor get saturation20 => FlintUiColor(_hslColor.withSaturation(0.20));

  FlintUiColor get saturation30 => FlintUiColor(_hslColor.withSaturation(0.30));

  FlintUiColor get saturation40 => FlintUiColor(_hslColor.withSaturation(0.40));

  FlintUiColor get saturation50 => FlintUiColor(_hslColor.withSaturation(0.50));

  FlintUiColor get saturation60 => FlintUiColor(_hslColor.withSaturation(0.60));

  FlintUiColor get saturation70 => FlintUiColor(_hslColor.withSaturation(0.70));

  FlintUiColor get saturation80 => FlintUiColor(_hslColor.withSaturation(0.80));

  FlintUiColor get saturation90 => FlintUiColor(_hslColor.withSaturation(0.90));

  FlintUiColor get saturation95 => FlintUiColor(_hslColor.withSaturation(0.95));

  FlintUiColor get inverse => FlintUiColor(
    HSLColor.fromAHSL(
      _hslColor.alpha,
      (_hslColor.hue + 180) % 360,
      _hslColor.saturation,
      1.0 - _hslColor.lightness,
    ),
  );
}
