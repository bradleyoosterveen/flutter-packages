import 'package:flutter/material.dart';
import 'package:flint_ui/flint_ui.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  static Future<dynamic> push(BuildContext context) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => ButtonScreen()));

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) => FlintUiScaffold(
    header: FlintUiAppBar(
      titleText: 'UiButton',
      onGoBack: Navigator.of(context).pop,
    ),
    body: const Buttons(),
  );
}

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) => FlintUiFlex.column(
    divider: FlintUiGap.column(context.themeData.spacing.sm),
    crossAxisAlignment: .stretch,
    children: [
      _PrimaryButtonInteractive(FlintUiText("Click me!")),
      FlintUiButton(
        size: .large,
        onPressed: () {},
        child: FlintUiText("Button (primary, large)"),
      ),
      FlintUiButton(
        size: .medium,
        onPressed: () {},
        child: FlintUiText("Button (primary, medium)"),
      ),
      FlintUiButton(
        size: .small,
        onPressed: () {},
        child: FlintUiText("Button (primary, small)"),
      ),
      FlintUiButton(
        style: (_) => context.themeData.buttonStyles.secondary,
        onPressed: () {},
        child: FlintUiText("Button (secondary)"),
      ),
      FlintUiButton(
        style: (_) => context.themeData.buttonStyles.outline,
        onPressed: () {},
        child: FlintUiText("Button (outline)"),
      ),
      FlintUiButton(
        style: (_) => context.themeData.buttonStyles.ghost,
        onPressed: () {},
        child: FlintUiText("Button (ghost)"),
      ),
      FlintUiButton(
        style: (_) => context.themeData.buttonStyles.primary,
        onPressed: () {},
        child: FlintUiFlex.row(
          mainAxisAlignment: .center,
          children: [FlintUiText("Button (primary)"), FlintUiIcon.circleSlash()],
        ),
      ),
      SingleChildScrollView(
        clipBehavior: .none,
        scrollDirection: .horizontal,
        child: FlintUiFlex.row(
          divider: FlintUiGap.row(context.themeData.spacing.sm),
          children: [
            FlintUiButton.square(child: FlintUiText("AB"), onPressed: () {}),
            FlintUiButton.square(
              size: .large,
              onPressed: () {},
              child: FlintUiText("AB"),
            ),
            FlintUiButton.square(
              fit: .cover,
              onPressed: () {},
              child: Image.network(
                "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.pexels.com%2Fphotos%2F3778876%2Fpexels-photo-3778876.jpeg%3Fcs%3Dsrgb%26dl%3Dpexels-olly-3778876.jpg%26fm%3Djpg&f=1&nofb=1&ipt=409a0298dbbec061b2d13154ecc5838ccf6bbb5966a13aa62c54fc1d06b803b7",
              ),
            ),
            FlintUiButton.square(
              fit: .cover,
              size: .large,
              onPressed: () {},
              child: Image.network(
                "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.pexels.com%2Fphotos%2F3778876%2Fpexels-photo-3778876.jpeg%3Fcs%3Dsrgb%26dl%3Dpexels-olly-3778876.jpg%26fm%3Djpg&f=1&nofb=1&ipt=409a0298dbbec061b2d13154ecc5838ccf6bbb5966a13aa62c54fc1d06b803b7",
              ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        clipBehavior: .none,
        scrollDirection: .horizontal,
        child: FlintUiFlex.row(
          divider: FlintUiGap.row(context.themeData.spacing.sm),
          children: [
            FlintUiButton(
              size: .small,
              onPressed: () {},
              child: FlintUiFlex.row(
                mainAxisAlignment: .center,
                children: [
                  FlintUiText("Currently reading"),
                  SizedBox.square(
                    dimension: 24,
                    child: Container(
                      padding: .all(2),
                      decoration: BoxDecoration(
                        color: Colors.red.shade500,
                        borderRadius: .all(.circular(99)),
                      ),
                      child: Center(child: FittedBox(child: FlintUiText('9+'))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class _PrimaryButtonInteractive extends StatefulWidget {
  const _PrimaryButtonInteractive(this.child);

  final Widget child;

  @override
  State<_PrimaryButtonInteractive> createState() => _PrimaryButtonInteractiveState();
}

class _PrimaryButtonInteractiveState extends State<_PrimaryButtonInteractive> {
  bool _loading = false;

  Future<void> _onClick() async {
    setState(() {
      _loading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) => FlintUiButton(onPressed: _onClick, isLoading: _loading, child: widget.child);
}
