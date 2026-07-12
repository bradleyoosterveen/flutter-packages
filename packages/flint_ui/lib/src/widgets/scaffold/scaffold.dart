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
    this.onRefresh,
    this.style = _defaultStyleBuilder,
    super.key,
  });

  final Widget body;
  final Widget? header;
  final Widget? floatingHeader;
  final Widget? footer;
  final Future<void> Function()? onRefresh;
  final FlintUiScaffoldStyle Function(FlintUiScaffoldStyle style) style;

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
          _maybeWrapInRefreshIndicator(
            child: FlintUiFlex.column(
              mainAxisSize: .min,
              children: [
                Flexible(
                  child: CustomScrollView(
                    controller: _scrollController,
                    clipBehavior: Clip.none,
                    physics: widget.onRefresh != null
                        ? const ClampingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          )
                        : const ClampingScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        fillOverscroll: false,
                        child: FlintUiFlex.column(
                          crossAxisAlignment: .start,
                          divider: FlintUiGap.column(context.themeData.spacing.sm),
                          children: [
                            if (header != null) ...[_header(header)],
                            Expanded(
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
                              Visibility.maintain(
                                visible: false,
                                child: _footer(footer),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (footer != null) ...[
            Align(alignment: .bottomCenter, child: _footer(footer)),
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

  Widget _footer(Widget footer) => Column(mainAxisSize: .min, children: [footer]);

  Widget _header(Widget header) => SafeArea(
    bottom: false,
    child: Padding(
      padding: .symmetric(horizontal: context.themeData.spacing.xs),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 0.08,
        ),
        child: header,
      ),
    ),
  );

  Widget _maybeWrapInRefreshIndicator({required Widget child}) => widget.onRefresh != null
      ? RefreshIndicator(
          onRefresh: widget.onRefresh ?? () => .value(),
          child: child,
        )
      : child;
}
