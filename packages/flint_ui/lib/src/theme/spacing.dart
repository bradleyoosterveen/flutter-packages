class FlintUiSpacing {
  static const double _base = 8;

  final double xxxs;
  final double xxs;
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;
  final double xxxl;

  const FlintUiSpacing({
    required this.xxxs,
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
    required this.xxxl,
  });

  factory FlintUiSpacing.base() => FlintUiSpacing(
    xxxs: _base / 4,
    xxs: _base / 2,
    xs: _base,
    sm: _base * 1.5,
    md: _base * 2,
    lg: _base * 3,
    xl: _base * 4,
    xxl: _base * 6,
    xxxl: _base * 8,
  );
}
