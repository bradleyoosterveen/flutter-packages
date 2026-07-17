import 'package:example/screens/examples/alert_screen.dart';
import 'package:example/screens/examples/button_screen.dart';
import 'package:example/screens/examples/card_screen.dart';
import 'package:example/screens/examples/carousel_screen.dart';
import 'package:example/screens/examples/field_screen.dart';
import 'package:example/screens/examples/informational_layout_screen.dart';
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
              child: FlintUiText('Scaffold (centered body)'),
              onPressed: () => ScaffoldScreen.push(context, .centeredBody),
            ),
            FlintUiCard(
              child: FlintUiText('Scaffold (top aligned body)'),
              onPressed: () => ScaffoldScreen.push(context, .topAlignedBody),
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
