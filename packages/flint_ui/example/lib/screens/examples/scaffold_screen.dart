import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

enum ScaffoldScreenVariant {
  bodyOnly,
  centeredBody,
  topAlignedBody,
  appBarAndBody,
  appBarAndBodyAndActionBar,
  appBarAndBodyAndBottomNavigationBar,
  appBarAndBodyAndActionBarAndFloatingHeader,
}

class ScaffoldScreen extends StatelessWidget {
  const ScaffoldScreen({required this.variant, super.key});

  final ScaffoldScreenVariant variant;

  static Future<dynamic> push(
    BuildContext context,
    ScaffoldScreenVariant variant,
  ) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => ScaffoldScreen(variant: variant)),
  );

  @override
  Widget build(BuildContext context) => switch (variant) {
    .bodyOnly => FlintUiScaffold(
      body: FlintUiFlex.column(
        divider: FlintUiGap.column(context.themeData.spacing.sm),
        crossAxisAlignment: .stretch,
        children: [
          ...List.generate(40, (i) => FlintUiText('This is only the body.')),
        ],
      ),
    ),
    .centeredBody => FlintUiScaffold(
      body: Center(
        child: FlintUiText('Centered'),
      ),
    ),
    .topAlignedBody => FlintUiScaffold(
      body: FlintUiText('Centered'),
    ),
    .appBarAndBody => FlintUiScaffold(
      header: FlintUiAppBar(
        titleText: 'UiScaffold',
        onGoBack: Navigator.of(context).pop,
      ),
      body: FlintUiFlex.column(
        divider: FlintUiGap.column(context.themeData.spacing.sm),
        crossAxisAlignment: .stretch,
        children: [...List.generate(40, (i) => FlintUiText('App bar and body.'))],
      ),
    ),
    .appBarAndBodyAndActionBar => FlintUiScaffold(
      header: FlintUiAppBar(
        titleText: 'UiScaffold',
        onGoBack: Navigator.of(context).pop,
      ),
      body: FlintUiFlex.column(
        divider: FlintUiGap.column(context.themeData.spacing.sm),
        crossAxisAlignment: .stretch,
        children: [
          ...List.generate(40, (i) => FlintUiText('App bar, body and action bar.')),
        ],
      ),
      footer: FlintUiActionBar(actions: [FlintUiButton(child: FlintUiText('Continue'))]),
    ),
    .appBarAndBodyAndBottomNavigationBar => FlintUiScaffold(
      header: FlintUiAppBar(
        titleText: 'UiScaffold',
        onGoBack: Navigator.of(context).pop,
      ),
      body: FlintUiFlex.column(
        divider: FlintUiGap.column(context.themeData.spacing.sm),
        crossAxisAlignment: .stretch,
        children: [
          ...List.generate(40, (i) => FlintUiText('App bar, body and action bar.')),
        ],
      ),
      footer: Builder(
        builder: (context) {
          var index = 0;

          return StatefulBuilder(
            builder: (context, setState) {
              return FlintUiBottomNavigationBar(
                items: [
                  FlintUiBottomNavigationBarItem(
                    icon: .house(),
                    isActive: index == 0,
                    onPressed: () => setState(() => index = 0),
                  ),
                  FlintUiBottomNavigationBarItem(
                    icon: .library(),
                    isActive: index == 1,
                    onPressed: () => setState(() => index = 1),
                  ),
                  FlintUiBottomNavigationBarItem(
                    icon: .sparkles(),
                    isActive: index == 2,
                    onPressed: () => setState(() => index = 2),
                  ),
                  FlintUiBottomNavigationBarItem(
                    icon: .search(),
                    isActive: index == 3,
                    onPressed: () => setState(() => index = 3),
                  ),
                ],
              );
            },
          );
        },
      ),
    ),
    .appBarAndBodyAndActionBarAndFloatingHeader => FlintUiScaffold(
      header: FlintUiAppBar(
        titleText: 'UiScaffold',
        onGoBack: Navigator.of(context).pop,
      ),
      floatingHeader: FlintUiAppBar(titleText: 'UiScaffold'),
      body: FlintUiFlex.column(
        divider: FlintUiGap.column(context.themeData.spacing.sm),
        crossAxisAlignment: .stretch,
        children: [
          ...List.generate(40, (i) => FlintUiText('App bar, body and action bar.')),
        ],
      ),
      footer: FlintUiActionBar(actions: [FlintUiButton(child: FlintUiText('Continue'))]),
    ),
  };
}
