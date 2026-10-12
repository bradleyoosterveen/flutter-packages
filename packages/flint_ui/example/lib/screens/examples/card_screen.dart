import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  static Future<dynamic> push(BuildContext context) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => CardScreen()));

  @override
  Widget build(BuildContext context) => FlintUiScaffold(
    header: FlintUiAppBar(titleText: 'UiCard', onGoBack: Navigator.of(context).pop),
    body: FlintUiFlex.column(
      divider: FlintUiGap.column(context.themeData.spacing.sm),
      crossAxisAlignment: .stretch,
      children: [
        FlintUiCard(
          style: (_) => context.themeData.cardStyles.filled,
          size: .extraSmall,
          child: Text('filled extra small'),
        ),
        FlintUiCard(
          style: (_) => context.themeData.cardStyles.filled,
          size: .small,
          child: Text('filled small'),
        ),
        FlintUiCard(
          style: (_) => context.themeData.cardStyles.filled,
          size: .medium,
          child: Text('filled medium'),
        ),
        FlintUiCard(
          style: (_) => context.themeData.cardStyles.filled,
          size: .large,
          child: Text('filled large'),
        ),
        FlintUiCard(
          style: (_) => context.themeData.cardStyles.outline,
          size: .medium,
          child: Text('outline medium'),
        ),
        FlintUiCard(
          style: (_) => context.themeData.cardStyles.filled,
          child: FlintUiFlex.row(
            children: [
              FlintUiFlex.column(
                crossAxisAlignment: .start,
                divider: FlintUiGap.column(context.themeData.spacing.xs),
                children: [
                  FlintUiText(
                    'Climbing',
                    style: (_) => context.themeData.textStyles.titleLarge,
                  ),
                  Builder(
                    builder: (context) {
                      final textStyle = context.themeData.textStyles.bodyMedium;

                      return FlintUiFlex.row(
                        divider: FlintUiGap.row(context.themeData.spacing.xs),
                        children: [
                          FlintUiIcon.circleInfo(
                            style: (_) => context.themeData.iconStyles.fromTextStyle(textStyle),
                          ),
                          FlintUiText(
                            'Tomorrow 19:00 - 22:00',
                            style: (_) => textStyle,
                          ),
                        ],
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      final textStyle = context.themeData.textStyles.bodyMedium;

                      return FlintUiFlex.row(
                        divider: FlintUiGap.row(context.themeData.spacing.xs),
                        children: [
                          FlintUiIcon.circleInfo(
                            style: (_) => context.themeData.iconStyles.fromTextStyle(textStyle),
                          ),
                          FlintUiText(
                            'Boulderhal Energiehaven',
                            style: (_) => textStyle,
                          ),
                        ],
                      );
                    },
                  ),
                  FlintUiFlex.row(
                    divider: FlintUiGap.row(context.themeData.spacing.xs),
                    children: [
                      FlintUiButton(
                        size: .small,
                        onPressed: () {},
                        style: (style) => style.copyWith(
                          backgroundColor: FlintUiColors.green.alpha10,
                          foregroundColor: FlintUiColors.green,
                        ),
                        child: FlintUiFlex.row(
                          divider: FlintUiGap.row(context.themeData.spacing.xs),
                          children: [FlintUiText('Yes'), FlintUiIcon.check()],
                        ),
                      ),
                      FlintUiButton.square(
                        size: .small,
                        onPressed: () {},
                        style: (style) => style.copyWith(
                          backgroundColor: FlintUiColors.orange.alpha10,
                          foregroundColor: FlintUiColors.orange,
                        ),
                        child: FlintUiText('?'),
                      ),
                      FlintUiButton.square(
                        size: .small,
                        onPressed: () {},
                        style: (style) => style.copyWith(
                          backgroundColor: FlintUiColors.red.alpha10,
                          foregroundColor: FlintUiColors.red,
                        ),
                        child: FlintUiIcon.x(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        FlintUiFlex.column(
          divider: FlintUiGap.column(context.themeData.spacing.sm),
          crossAxisAlignment: .stretch,
          children: List.generate(
            3,
            (index) => FlintUiCardGroup(
              cards: List.generate(
                index + 1,
                (index) => FlintUiCard(
                  style: (_) => context.themeData.cardStyles.filled,
                  size: .medium,
                  child: Text('Grouped $index'),
                ),
              ),
            ),
          ),
        ),
        // Horizontal card group example
        FlintUiCardGroup(
          direction: Axis.horizontal,
          cards: [
            FlintUiCard(
              style: (_) => context.themeData.cardStyles.filled,
              size: .medium,
              child: Text('Horizontal 1'),
            ),
            FlintUiCard(
              style: (_) => context.themeData.cardStyles.filled,
              size: .medium,
              child: Text('Horizontal 2'),
            ),
            FlintUiCard(
              style: (_) => context.themeData.cardStyles.filled,
              size: .medium,
              child: Text('Horizontal 3'),
            ),
          ],
        ),
        // Nested card group example
        FlintUiCardGroup(
          cards: [
            FlintUiCard(
              style: (_) => context.themeData.cardStyles.filled,
              size: .medium,
              child: Text('Parent Card 1'),
            ),
            FlintUiCard(
              style: (_) => context.themeData.cardStyles.filled,
              size: .medium,
              child: Column(
                crossAxisAlignment: .stretch,
                children: [
                  FlintUiCard(
                    style: (_) => context.themeData.cardStyles.outline,
                    size: .small,
                    child: Text('Not a direct nest'),
                  ),
                  FlintUiCard(
                    style: (_) => context.themeData.cardStyles.outline,
                    size: .small,
                    child: Text('Not a direct nest'),
                  ),
                  FlintUiCardGroup(
                    cards: [
                      Container(
                        color: FlintUiColors.green.alpha05.color,
                        child: FlintUiCard(
                          size: .medium,
                          child: Text('Parent Card 1, wrapped by a Container'),
                        ),
                      ),
                      Container(
                        color: FlintUiColors.green.alpha05.color,
                        child: FlintUiCard(
                          size: .medium,
                          child: Text('Parent Card 3, wrapped by a Container'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FlintUiCard(
              style: (_) => context.themeData.cardStyles.filled,
              size: .medium,
              child: Text('Parent Card 3'),
            ),
          ],
        ),
      ],
    ),
  );
}
