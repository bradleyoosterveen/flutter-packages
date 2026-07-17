import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  static Future<dynamic> push(BuildContext context) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => AlertScreen()));

  @override
  Widget build(BuildContext context) => FlintUiScaffold(
    header: FlintUiAppBar(titleText: 'UiAlert', onGoBack: Navigator.of(context).pop),
    body: FlintUiFlex.column(
      divider: FlintUiGap.column(context.themeData.spacing.sm),
      children: [
        FlintUiAlert(
          title: 'New update available',
          body: 'Download the new update now through the settings page.',
          icon: .circleInfo(),
          style: (_) => context.themeData.alertStyles.info,
        ),
        FlintUiAlert(
          title: 'Profile picture updated',
          icon: .circleCheck(),
          style: (_) => context.themeData.alertStyles.success,
        ),
        FlintUiAlert(
          title: 'E-mail invalid',
          icon: .circleAlert(),
          style: (_) => context.themeData.alertStyles.warning,
        ),
        FlintUiAlert(
          title: 'Too many sign in attempts',
          icon: .circleSlash(),
          style: (_) => context.themeData.alertStyles.error,
        ),
        FlintUiButton(
          child: FlintUiText('Trigger info alert'),
          onPressed: () {
            FlintUiAlertOverlayNotifier.of(context).add(
              title: 'New update available',
              icon: .circleInfo(),
              style: context.themeData.alertStyles.info,
            );
          },
        ),
      ],
    ),
  );
}
