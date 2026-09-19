import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

part 'scaffold.style.dart';

class FlintUiScaffold extends StatefulWidget {
  static FlintUiScaffoldStyle _defaultStyleBuilder(FlintUiScaffoldStyle style) => style;

  const FlintUiScaffold({
    required this.body,
    this.header,
    this.floatingHeader,
    this.footer,
    this.style = _defaultStyleBuilder,
    this.bodyFillRemaining = false,
    this.bodyHasScroll = false,
    super.key,
  });

  final Widget body;
  final Widget? header;
  final Widget? floatingHeader;
  final Widget? footer;
  final FlintUiScaffoldStyle Function(FlintUiScaffoldStyle style) style;

  /// Will wrap the body in a SliverFillRemaining, meaning widgets such as GridView are not supported then this is set to true.
  final bool bodyFillRemaining;

  final bool bodyHasScroll;

  @override
  State<FlintUiScaffold> createState() => _FlintUiScaffoldState();
}

class _FlintUiScaffoldState extends State<FlintUiScaffold> {
  final ScrollController _scrollController = ScrollController();

  late final double _scrollThreshold = MediaQuery.of(context).size.height * 0.1;

  bool _showFloatingHeader = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels > _scrollThreshold) {
      if (!_showFloatingHeader) {
        setState(() {
          _showFloatingHeader = true;
        });
      }
    } else {
      if (_showFloatingHeader) {
        setState(() {
          _showFloatingHeader = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final header = widget.header;
    final floatingHeader = widget.floatingHeader;
    final body = widget.body;
    final footer = widget.footer;

    final resolvedStyle = widget.style(DefaultFlintUiScaffoldStyle.of(context));

    return Scaffold(
      backgroundColor: resolvedStyle.backgroundColor.color,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                if (header != null) ...[
                  SliverToBoxAdapter(
                    child: _header(header),
                  ),
                ],
                _maybeWrapInSliverFillRemaining(
                  child: SafeArea(
                    top: header == null,
                    bottom: footer == null,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: resolvedStyle.horizontalInset,
                      ),
                      child: body,
                    ),
                  ),
                ),
                if (footer != null) ...[
                  SliverToBoxAdapter(
                    child: Visibility.maintain(
                      visible: false,
                      child: _footer(footer, resolvedStyle),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (footer != null) ...[
            Align(alignment: .bottomCenter, child: _footer(footer, resolvedStyle)),
          ],
          if (floatingHeader != null) ...[
            Align(
              alignment: .topCenter,
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                offset: _showFloatingHeader ? Offset(0, 0) : Offset(0, -1),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: resolvedStyle.floatingHeaderBackgroundColor.color,
                    borderRadius: const .only(
                      bottomLeft: .circular(16),
                      bottomRight: .circular(16),
                    ),
                  ),
                  child: _header(floatingHeader),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _maybeWrapInSliverFillRemaining({required Widget child}) => widget.bodyFillRemaining
      ? SliverFillRemaining(hasScrollBody: widget.bodyHasScroll, child: child)
      : SliverToBoxAdapter(child: child);

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
              ],
              tileMode: .mirror,
            ),
          ),
        ),
      ),
      Column(
        mainAxisSize: .min,
        children: [footer],
      ),
    ],
  );

  Widget _header(Widget header) => ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height * 0.08,
    ),
    child: header,
  );
}
