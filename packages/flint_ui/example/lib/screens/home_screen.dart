import 'package:example/screens/alert_screen.dart';
import 'package:example/screens/button_screen.dart';
import 'package:example/screens/card_screen.dart';
import 'package:example/screens/carousel_screen.dart';
import 'package:example/screens/field_screen.dart';
import 'package:example/screens/informational_layout_screen.dart';
import 'package:example/screens/scaffold_screen.dart';
import 'package:example/screens/text_screen.dart';
import 'package:example/screens/url_preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

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
              child: FlintUiText('Scaffold (body only)'),
              onPressed: () => ScaffoldScreen.push(context, .bodyOnly),
            ),
            FlintUiCard(
              child: FlintUiText('Scaffold (app bar and body)'),
              onPressed: () => ScaffoldScreen.push(context, .appBarAndBody),
            ),
            FlintUiCard(
              child: FlintUiText('Scaffold (app bar, body and action bar)'),
              onPressed: () => ScaffoldScreen.push(context, .appBarAndBodyAndActionBar),
            ),
            FlintUiCard(
              child: FlintUiText(
                'Scaffold (app bar, body and bottom navigation bar)',
              ),
              onPressed: () => ScaffoldScreen.push(
                context,
                .appBarAndBodyAndBottomNavigationBar,
              ),
            ),
            FlintUiCard(
              child: FlintUiText(
                'Scaffold (app bar, body, action bar and floating header)',
              ),
              onPressed: () => ScaffoldScreen.push(
                context,
                .appBarAndBodyAndActionBarAndFloatingHeader,
              ),
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
