import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

part 'scaffold.style.dart';

class FlintUiScaffold extends StatefulWidget {
  static FlintUiScaffoldStyle _defaultStyleBuilder(FlintUiScaffoldStyle style) => style;

  const FlintUiScaffold({
    required this.body,
    this.header,
    this.footer,
    this.style = _defaultStyleBuilder,
    this.bodyFillRemaining = false,
    super.key,
  });

  final Widget body;
  final Widget? header;
  final Widget? footer;
  final FlintUiScaffoldStyle Function(FlintUiScaffoldStyle style) style;
  final bool bodyFillRemaining;

  @override
  State<FlintUiScaffold> createState() => _FlintUiScaffoldState();
}

class _FlintUiScaffoldState extends State<FlintUiScaffold> {
  @override
  Widget build(BuildContext context) {
    final header = widget.header;
    final body = widget.body;
    final footer = widget.footer;

    final resolvedStyle = widget.style(DefaultFlintUiScaffoldStyle.of(context));

    return Scaffold(
      backgroundColor: resolvedStyle.backgroundColor.color,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: FlintUiFlex.column(
              crossAxisAlignment: .stretch,
              mainAxisSize: .max,
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      clipBehavior: .none,
                      child: _maybeFillRemaining(
                        constraints: constraints,
                        child: Column(
                          mainAxisSize: .max,
                          children: [
                            if (header != null) ...[
                              _header(header, resolvedStyle),
                            ],
                            _maybeExpanded(child: body),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (footer != null) ...[
                  Visibility.maintain(
                    visible: false,
                    child: _footer(footer, resolvedStyle),
                  ),
                ],
              ],
            ),
          ),
          if (footer != null) ...[
            Align(
              alignment: .bottomCenter,
              child: _footer(footer, resolvedStyle),
            ),
          ],
        ],
      ),
    );
  }

  Widget _maybeExpanded({required Widget child}) => widget.bodyFillRemaining ? Expanded(child: child) : child;

  Widget _maybeFillRemaining({required Widget child, required BoxConstraints constraints}) => widget.bodyFillRemaining
      ? IntrinsicHeight(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.minHeight,
            ),
            child: child,
          ),
        )
      : child;

  Widget _footer(Widget footer, FlintUiScaffoldStyle resolvedStyle) => Stack(
    children: [
      Positioned.fill(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: .topCenter,
              end: .bottomCenter,
              colors: [
                resolvedStyle.backgroundColor.color.withAlpha(0),
                resolvedStyle.backgroundColor.color,
                resolvedStyle.backgroundColor.color,
                resolvedStyle.backgroundColor.color,
              ],
              tileMode: .mirror,
            ),
          ),
        ),
      ),
      Column(mainAxisSize: .min, children: [footer]),
    ],
  );

  Widget _header(Widget header, FlintUiScaffoldStyle resolvedStyle) => header;
}
