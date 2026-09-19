import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  static Future<dynamic> push(BuildContext context) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => CarouselScreen()));

  @override
  Widget build(BuildContext context) => FlintUiScaffold(
    header: FlintUiAppBar(
      titleText: 'UiCarousel',
      onGoBack: Navigator.of(context).pop,
    ),
    body: SizedBox(
      height: 300,
      child: FlintUiCarousel(
        items: List.generate(
          11,
          (index) => Placeholder(
            child: Center(child: Text(index.toString())),
          ),
        ),
      ),
    ),
  );
}
