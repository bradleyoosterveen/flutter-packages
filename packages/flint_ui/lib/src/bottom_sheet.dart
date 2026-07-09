import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

class FlintUiBottomSheet extends StatelessWidget {
  const FlintUiBottomSheet({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: .symmetric(horizontal: context.themeData.spacing.sm),
    child: Container(
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        borderRadius: const .all(.circular(16)),
        color: context.themeData.scaffoldStyles.primary.backgroundColor.color,
      ),
      child: SafeArea(
        child: SingleChildScrollView(clipBehavior: .none, child: child),
      ),
    ),
  );
}
