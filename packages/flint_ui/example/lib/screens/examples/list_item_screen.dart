import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

class ListItemScreen extends StatelessWidget {
  const ListItemScreen({super.key});

  static Future<dynamic> push(BuildContext context) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => ListItemScreen()));

  @override
  Widget build(BuildContext context) => FlintUiScaffold(
    header: FlintUiAppBar(titleText: 'UiListItem', onGoBack: Navigator.of(context).pop),
    body: FlintUiFlex.column(
      divider: FlintUiGap.column(context.themeData.spacing.sm),
      crossAxisAlignment: .stretch,
      children: [
        FlintUiText('Note: All have been wrapped in a FlintUiCard for better visibility.').centered(),
        FlintUiCard(
          child: FlintUiListItem(
            title: FlintUiText('Simple List Item'),
          ),
        ),
        FlintUiCard(
          child: FlintUiListItem(
            title: FlintUiText('List Item with Subtitle'),
            subtitle: FlintUiText('This is a subtitle'),
          ),
        ),
        FlintUiCard(
          child: FlintUiListItem(
            prefix: FlintUiIcon.circleInfo(),
            title: FlintUiText('List Item with Prefix'),
          ),
        ),
        FlintUiCard(
          child: FlintUiListItem(
            title: FlintUiText('List Item with Suffix'),
            suffix: FlintUiIcon.chevronRight(),
          ),
        ),
        FlintUiCard(
          child: FlintUiListItem(
            prefix: FlintUiIcon.user(),
            title: FlintUiText('List Item with Prefix and Suffix'),
            suffix: FlintUiIcon.settings(),
          ),
        ),
        FlintUiCard(
          child: FlintUiListItem(
            prefix: FlintUiIcon.circleInfo(),
            title: FlintUiText('Complete List Item'),
            subtitle: FlintUiText('This has all properties set'),
            suffix: FlintUiIcon.chevronRight(),
          ),
        ),
        FlintUiCard(
          child: FlintUiFlex.column(
            divider: FlintUiGap.column(context.themeData.spacing.xs),
            children: [
              FlintUiListItem(
                prefix: FlintUiIcon.user(),
                title: FlintUiText('Item 1'),
                suffix: FlintUiIcon.chevronRight(),
              ),
              FlintUiListItem(
                prefix: FlintUiIcon.circleInfo(),
                title: FlintUiText('Item 2'),
                subtitle: FlintUiText('Additional info'),
                suffix: FlintUiIcon.chevronRight(),
              ),
              FlintUiListItem(
                prefix: FlintUiIcon.settings(),
                title: FlintUiText('Item 3'),
                suffix: FlintUiIcon.chevronRight(),
              ),
            ],
          ),
        ),
        FlintUiCard(
          child: FlintUiListItem(
            prefix: Icon(Icons.star, color: Colors.amber),
            title: FlintUiText('Custom Widget Prefix'),
            subtitle: FlintUiText('Using Flutter Icon widget'),
            suffix: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
      ],
    ),
  );
}
