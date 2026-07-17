import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

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
    body: FlintUiFlex.column(
      crossAxisAlignment: .stretch,
      mainAxisAlignment: .center,
      divider: FlintUiGap.column(context.themeData.spacing.sm),
      children: [
        Expanded(
          child: FlintUiCarousel(
            items: List.generate(
              11,
              (index) => Center(
                child: Placeholder(
                  child: Padding(
                    padding: const EdgeInsets.all(128),
                    child: Text(index.toString()),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
