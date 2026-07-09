import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

class InformationalLayoutScreen extends StatelessWidget {
  const InformationalLayoutScreen({super.key});

  static Future<dynamic> push(BuildContext context) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => InformationalLayoutScreen()));

  @override
  Widget build(BuildContext context) => FlintUiScaffold(
    header: FlintUiAppBar(
      titleText: 'UiInformationalLayout',
      onGoBack: Navigator.of(context).pop,
    ),
    body: FlintUiFlex.column(
      divider: FlintUiGap.column(context.themeData.spacing.xxl),
      children: [
        FlintUiInformationalLayout(
          icon: .externalLink(),
          title: 'You are about to leave the app',
          subtitle: 'Are you sure that you want to navigate to the following link?',
          body: FlintUiUrlPreview(url: 'https://www.google.com/'),
          actions: [
            FlintUiButton(child: FlintUiText('Confirm'), onPressed: () {}),
            FlintUiButton(
              style: (_) => context.themeData.buttonStyles.secondary,
              child: FlintUiText('Cancel'),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ),
  );
}
