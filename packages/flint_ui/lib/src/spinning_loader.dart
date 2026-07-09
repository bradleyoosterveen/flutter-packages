import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flint_ui/flint_ui.dart';

class FlintUiSpinningLoader extends StatelessWidget {
  const FlintUiSpinningLoader({super.key});

  @override
  Widget build(BuildContext context) => FlintUiIcon.loaderCircle(
    style: (style) => style.copyWith(size: 42),
  ).animate(onPlay: (controller) => controller.repeat()).rotate(duration: Duration(milliseconds: 900));
}
