import 'package:flutter/cupertino.dart';
import 'package:flint_ui/flint_ui.dart';

class FlintUiCarousel extends StatefulWidget {
  const FlintUiCarousel({required this.items, super.key});

  final List<Widget> items;

  @override
  State<FlintUiCarousel> createState() => _FlintUiCarouselState();
}

class _FlintUiCarouselState extends State<FlintUiCarousel> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
  }

  @override
  void didUpdateWidget(FlintUiCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 1,
    child: FlintUiFlex.column(
      divider: FlintUiGap.column(context.themeData.spacing.md),
      children: [
        Expanded(
          child: PageView.custom(
            pageSnapping: false,
            physics: const PageScrollPhysics(),
            clipBehavior: Clip.none,
            controller: _pageController,
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
              final child = widget.items[index];

              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, _) {
                  final page = _pageController.page ?? 0;
                  final offset = page - index;
                  final scaleValue = Curves.easeOut.transform(
                    (1 - (offset.abs() * .5)).clamp(0.0, 1.0),
                  );

                  final alignment = offset < 0
                      ? Alignment.centerLeft
                      : offset > 0
                      ? Alignment.centerRight
                      : Alignment.center;

                  return Transform.scale(
                    scale: scaleValue,
                    alignment: alignment,
                    child: child,
                  );
                },
              );
            }, childCount: widget.items.length),
          ),
        ),
      ],
    ),
  );
}
