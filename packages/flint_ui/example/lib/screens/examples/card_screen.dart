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
        FlintUiCard(
          style: (_) => context.themeData.cardStyles.filled,
          child: FlintUiFlex.column(
            crossAxisAlignment: .start,
            divider: FlintUiGap.column(context.themeData.spacing.xs),
            children: [
              FlintUiText(
                'Timeslot',
                style: (_) => context.themeData.textStyles.titleMedium,
              ),
              FlintUiFlex.row(
                divider: FlintUiGap.row(context.themeData.spacing.xs),
                children: [
                  FlintUiCard(
                    size: .small,
                    child: FlintUiText(
                      '02-02-2024',
                      style: (_) => context.themeData.textStyles.labelLarge,
                    ),
                  ),
                  FlintUiCard(
                    size: .small,
                    child: FlintUiText(
                      '19:00',
                      style: (_) => context.themeData.textStyles.labelLarge,
                    ),
                  ),
                ],
              ),
              FlintUiFlex.row(
                divider: FlintUiGap.row(context.themeData.spacing.xs),
                children: [
                  FlintUiCard(
                    size: .small,
                    child: FlintUiText(
                      '02-02-2024',
                      style: (_) => context.themeData.textStyles.labelLarge,
                    ),
                  ),
                  FlintUiCard(
                    size: .small,
                    child: FlintUiText(
                      '23:00',
                      style: (_) => context.themeData.textStyles.labelLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
