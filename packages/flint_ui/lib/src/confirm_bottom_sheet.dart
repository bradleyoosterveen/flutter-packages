import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

class FlintUiConfirmBottomSheet extends StatelessWidget {
  const FlintUiConfirmBottomSheet({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.confirmButton,
    required this.cancelButton,
    this.body,
    super.key,
  });

  final FlintUiIcon icon;
  final String title;
  final String subtitle;
  final FlintUiButton confirmButton;
  final FlintUiButton cancelButton;

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
