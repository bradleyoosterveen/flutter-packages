import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

class FlintUiActionBar extends StatelessWidget {
  const FlintUiActionBar({required this.actions, super.key});

  final List<Widget> actions;

  @override
  Widget build(BuildContext context) => SafeArea(
    top: false,
    child: Padding(
      padding: EdgeInsets.all(context.themeData.spacing.xs),
      child: FlintUiFlex.column(
        divider: FlintUiGap.column(context.themeData.spacing.sm),
        mainAxisSize: .min,
        children: actions,
      ),
    ),
  );
}
