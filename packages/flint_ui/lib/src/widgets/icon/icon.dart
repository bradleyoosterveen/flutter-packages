import 'package:flint_ui/flint_ui.dart';
import 'package:flint_ui/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

part 'icon.style.dart';

typedef FlintUiIconStyleBuilder = FlintUiIconStyle Function(FlintUiIconStyle style);

/// Source: https://lucide.dev/
class FlintUiIcon extends StatelessWidget {
  static FlintUiIconStyle _defaultStyleBuilder(FlintUiIconStyle style) => style;

  const FlintUiIcon._(this.icon, [this.style = _defaultStyleBuilder]);

  factory FlintUiIcon({
    required String icon,
    FlintUiIconStyleBuilder style = _defaultStyleBuilder,
  }) => FlintUiIcon._(icon, style);

  factory FlintUiIcon.bell({
    FlintUiIconStyleBuilder style = _defaultStyleBuilder,
  }) => FlintUiIcon._(Assets.icons.lucideBell24Regular, style);

  factory FlintUiIcon.bookUser({
    FlintUiIconStyleBuilder style = _defaultStyleBuilder,
  }) => FlintUiIcon._(Assets.icons.lucideBookUser24Regular, style);

  factory FlintUiIcon.chevronLeft({
    FlintUiIconStyleBuilder style = _defaultStyleBuilder,
  }) => FlintUiIcon._(Assets.icons.lucideChevronLeft24Regular, style);

  factory FlintUiIcon.circleAlert({
    FlintUiIconStyleBuilder style = _defaultStyleBuilder,
  }) => FlintUiIcon._(Assets.icons.lucideCircleAlert24Regular, style);

  factory FlintUiIcon.circleCheck({
    FlintUiIconStyleBuilder style = _defaultStyleBuilder,
  }) => FlintUiIcon._(Assets.icons.lucideCircleCheck24Regular, style);

  factory FlintUiIcon.circleInfo({
    FlintUiIconStyleBuilder style = _defaultStyleBuilder,
  }) => FlintUiIcon._(Assets.icons.lucideCircleInfo24Regular, style);

  factory FlintUiIcon.circleSlash({
    FlintUiIconStyleBuilder style = _defaultStyleBuilder,
  }) => FlintUiIcon._(Assets.icons.lucideCircleSlash24Regular, style);

  factory FlintUiIcon.check({FlintUiIconStyleBuilder style = _defaultStyleBuilder}) =>
      FlintUiIcon._(Assets.icons.lucideCheck24Regular, style);

  factory FlintUiIcon.clipboardCopy({
    FlintUiIconStyleBuilder style = _defaultStyleBuilder,
  }) => FlintUiIcon._(Assets.icons.lucideClipboardCopy24Regular, style);

  factory FlintUiIcon.clipboardPaste({
    FlintUiIconStyleBuilder style = _defaultStyleBuilder,
  }) => FlintUiIcon._(Assets.icons.lucideClipboardPaste24Regular, style);

  factory FlintUiIcon.externalLink({
    FlintUiIconStyleBuilder style = _defaultStyleBuilder,
  }) => FlintUiIcon._(Assets.icons.lucideExternalLink24Regular, style);

  factory FlintUiIcon.loaderCircle({
    FlintUiIconStyleBuilder style = _defaultStyleBuilder,
  }) => FlintUiIcon._(Assets.icons.lucideLoaderCircle24Regular, style);

  factory FlintUiIcon.house({FlintUiIconStyleBuilder style = _defaultStyleBuilder}) =>
      FlintUiIcon._(Assets.icons.lucideHouse24Regular, style);

  factory FlintUiIcon.library({FlintUiIconStyleBuilder style = _defaultStyleBuilder}) =>
      FlintUiIcon._(Assets.icons.lucideLibrary24Regular, style);

  factory FlintUiIcon.logOut({FlintUiIconStyleBuilder style = _defaultStyleBuilder}) =>
      FlintUiIcon._(Assets.icons.lucideLogOut24Regular, style);

  factory FlintUiIcon.search({FlintUiIconStyleBuilder style = _defaultStyleBuilder}) =>
      FlintUiIcon._(Assets.icons.lucideSearch24Regular, style);

  factory FlintUiIcon.settings({FlintUiIconStyleBuilder style = _defaultStyleBuilder}) =>
      FlintUiIcon._(Assets.icons.lucideSettings24Regular, style);

  factory FlintUiIcon.sparkles({FlintUiIconStyleBuilder style = _defaultStyleBuilder}) =>
      FlintUiIcon._(Assets.icons.lucideSparkles24Regular, style);

  factory FlintUiIcon.user({FlintUiIconStyleBuilder style = _defaultStyleBuilder}) =>
      FlintUiIcon._(Assets.icons.lucideUser24Regular, style);

  factory FlintUiIcon.x({FlintUiIconStyleBuilder style = _defaultStyleBuilder}) =>
      FlintUiIcon._(Assets.icons.lucideX24Regular, style);

  final String icon;
  final FlintUiIconStyleBuilder style;

  String get assetName => icon;

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = style(DefaultFlintUiIconStyle.of(context));

    return SvgPicture.asset(
      assetName,
      width: resolvedStyle.size,
      height: resolvedStyle.size,
      colorFilter: .mode(resolvedStyle.color.color, BlendMode.srcIn),
      package: 'flint_ui',
    );
  }
}
