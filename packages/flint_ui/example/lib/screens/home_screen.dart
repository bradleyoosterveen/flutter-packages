import 'package:example/screens/examples/alert_screen.dart';
import 'package:example/screens/examples/bottom_sheet_screen.dart';
import 'package:example/screens/examples/button_screen.dart';
import 'package:example/screens/examples/card_screen.dart';
import 'package:example/screens/examples/carousel_screen.dart';
import 'package:example/screens/examples/field_screen.dart';
import 'package:example/screens/examples/informational_layout_screen.dart';
import 'package:example/screens/examples/list_item_screen.dart';
import 'package:example/screens/examples/scaffold_screen.dart';
import 'package:example/screens/examples/text_screen.dart';
import 'package:example/screens/examples/url_preview_screen.dart';
import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Future<dynamic> push(BuildContext context) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => HomeScreen()));

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => DefaultFlintUiTextStyle(
    style: context.themeData.textStyles.labelLarge,
    child: DefaultFlintUiCardStyle(
      style: context.themeData.cardStyles.outline,
      child: FlintUiScaffold(
        header: FlintUiAppBar(titleText: 'Home'),
        body: FlintUiFlex.column(
          crossAxisAlignment: .stretch,
          divider: FlintUiGap.column(context.themeData.spacing.sm),
          children: [
            FlintUiCard(
              child: FlintUiText('Alert'),
              onPressed: () => AlertScreen.push(context),
            ),
            FlintUiCard(
              child: FlintUiText('BottomSheet'),
              onPressed: () => BottomSheetScreen.push(context),
            ),
            FlintUiCard(
              child: FlintUiText('Button'),
              onPressed: () => ButtonScreen.push(context),
            ),
            FlintUiCard(
              child: FlintUiText('Card'),
              onPressed: () => CardScreen.push(context),
            ),
            FlintUiCard(
              child: FlintUiText('Carousel'),
              onPressed: () => CarouselScreen.push(context),
            ),
            FlintUiCard(
              child: FlintUiText('Field'),
              onPressed: () => FieldScreen.push(context),
            ),
            FlintUiCard(
              child: FlintUiText('InformationalLayout'),
              onPressed: () => InformationalLayoutScreen.push(context),
            ),
            FlintUiCard(
              child: FlintUiText('ListItem'),
              onPressed: () => ListItemScreen.push(context),
            ),
            FlintUiCard(
              child: FlintUiText('Scaffold - Only a body, implemented as a column with 40 items for scrolling.'),
              onPressed: () => ScaffoldScreen.push(context, .a),
            ),
            FlintUiCard(
              child: FlintUiText('Scaffold - Only a body, aligned to the center with one small piece of text.'),
              onPressed: () => ScaffoldScreen.push(context, .b),
            ),
            FlintUiCard(
              child: FlintUiText(
                'Scaffold - A body and a header, aligned to the center with one small piece of text.',
              ),
              onPressed: () => ScaffoldScreen.push(context, .c),
            ),
            FlintUiCard(
              child: FlintUiText('Scaffold - Only a body, aligned to the top with one small piece of text.'),
              onPressed: () => ScaffoldScreen.push(context, .d),
            ),
            FlintUiCard(
              child: FlintUiText('Scaffold - A header, body with 4 (non scrolling) items and footer'),
              onPressed: () => ScaffoldScreen.push(context, .e),
            ),
            FlintUiCard(
              child: FlintUiText('Scaffold - A header, body with 20 (scrolling) items and footer'),
              onPressed: () => ScaffoldScreen.push(context, .f),
            ),
            FlintUiCard(
              child: FlintUiText('Scaffold - A header, body with 20 (scrolling) items (in a grid) and footer'),
              onPressed: () => ScaffoldScreen.push(context, .g),
            ),
            FlintUiCard(
              child: FlintUiText('Scaffold - A header, body with 2 + 1 non-items with fill remaining and footer'),
              onPressed: () => ScaffoldScreen.push(context, .h),
            ),
            FlintUiCard(
              child: FlintUiText('Text'),
              onPressed: () => TextScreen.push(context),
            ),
            FlintUiCard(
              child: FlintUiText('UrlPreview'),
              onPressed: () => UrlPreviewScreen.push(context),
            ),
          ],
        ),
      ),
    ),
  );
}
