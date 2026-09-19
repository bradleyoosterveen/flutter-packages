import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

enum ScaffoldScreenVariant {
  a,
  b,
  c,
  d,
  e,
  f,
  g,
  h,
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
    .a => FlintUiScaffold(
      body: FlintUiCardGroup(
        cards: _listItems(context, 20),
      ),
    ),
    .b => FlintUiScaffold(
      bodyFillRemaining: true,
      body: Center(child: FlintUiText('Center aligned')),
    ),
    .c => FlintUiScaffold(
      header: _header(context),
      bodyFillRemaining: true,
      body: Center(child: FlintUiText('Center aligned')),
    ),
    .d => FlintUiScaffold(
      body: FlintUiText('Top aligned'),
    ),
    .e => FlintUiScaffold(
      header: _header(context),
      body: FlintUiCardGroup(
        cards: _listItems(context, 4),
      ),
      footer: _footer,
    ),
    .f => FlintUiScaffold(
      header: _header(context),
      body: FlintUiCardGroup(
        cards: _listItems(context, 20),
      ),
      footer: _footer,
    ),
    .g => FlintUiScaffold(
      header: _header(context),
      body: GridView.count(
        padding: .zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: context.themeData.spacing.xs,
        mainAxisSpacing: context.themeData.spacing.xs,
        children: _listItems(context, 20),
      ),
      footer: _footer,
    ),
    .h => FlintUiScaffold(
      header: _header(context),
      bodyFillRemaining: true,
      body: FlintUiFlex.column(
        divider: FlintUiGap.column(context.themeData.spacing.md),
        crossAxisAlignment: .stretch,
        children: [
          FlintUiCardGroup(
            cards: _listItems(context, 2),
          ),
          Spacer(),
          FlintUiCardGroup(
            cards: _listItems(context, 1),
          ),
        ],
      ),
      footer: _footer,
    ),
  };

  List<Widget> _listItems(BuildContext context, int length) => List.generate(
    length,
    (i) => FlintUiCard(child: FlintUiText("Item #${i + 1}")),
  );

  Widget _header(BuildContext context) => FlintUiAppBar(
    titleText: 'UiScaffold',
    onGoBack: Navigator.of(context).pop,
  );

  Widget get _footer => Builder(
    builder: (context) {
      var index = 0;

      return StatefulBuilder(
        builder: (context, setState) {
          return FlintUiBottomNavigationBar(
            items: [
              FlintUiBottomNavigationBarItem(
                isActive: index == 0,
                onPressed: () => setState(() => index = 0),
                child: FlintUiFlex.column(
                  children: [
                    FlintUiIcon.house(),
                    FlintUiText('Home'),
                  ],
                ),
              ),
              FlintUiBottomNavigationBarItem(
                isActive: index == 1,
                onPressed: () => setState(() => index = 1),
                child: FlintUiFlex.column(
                  children: [
                    FlintUiIcon.library(),
                    FlintUiText('Library'),
                  ],
                ),
              ),
              FlintUiBottomNavigationBarItem(
                isActive: index == 2,
                onPressed: () => setState(() => index = 2),
                child: FlintUiFlex.column(
                  children: [
                    FlintUiIcon.search(),
                    FlintUiText('Search'),
                  ],
                ),
              ),
              FlintUiBottomNavigationBarItem(
                isActive: index == 3,
                onPressed: () => setState(() => index = 3),
                child: FlintUiFlex.column(
                  children: [
                    FlintUiIcon.user(),
                    FlintUiText('Profile'),
                  ],
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
