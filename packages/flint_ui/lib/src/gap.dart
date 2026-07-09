import 'package:flutter/widgets.dart';

class FlintUiGap extends StatelessWidget {
  const FlintUiGap(this.width, this.height, {super.key});

  factory FlintUiGap.none() => const FlintUiGap(0, 0);

  factory FlintUiGap.column(double size) => FlintUiGap(0, size);

  factory FlintUiGap.vertical(double size) => FlintUiGap(0, size);

  factory FlintUiGap.row(double size) => FlintUiGap(size, 0);

  factory FlintUiGap.horizontal(double size) => FlintUiGap(size, 0);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(width: width, height: height);
}
