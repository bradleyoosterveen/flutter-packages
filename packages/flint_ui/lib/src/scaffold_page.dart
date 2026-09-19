import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/widgets.dart';

enum FlintUiScaffoldPagePaddingDensity { none, compact }

class FlintUiScaffoldPage extends StatelessWidget {
  const FlintUiScaffoldPage({
    required this.child,
    this.paddingDensity = .compact,
    super.key,
  });

  final FlintUiScaffoldPagePaddingDensity paddingDensity;

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(
      horizontal: switch (paddingDensity) {
        .none => 0,
        .compact => context.themeData.spacing.sm,
      },
    ),
    child: child,
  );
}
