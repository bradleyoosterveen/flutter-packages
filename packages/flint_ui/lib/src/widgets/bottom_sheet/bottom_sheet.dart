import 'package:flint_ui/flint_ui.dart';
import 'package:flint_ui/src/widgets/bottom_sheet/bottom_sheet.style.dart';
import 'package:flutter/material.dart';

class FlintUiBottomSheet extends StatelessWidget {
  static FlintUiBottomSheetStyle _defaultStyleBuilder(FlintUiBottomSheetStyle style) => style;

  const FlintUiBottomSheet({
    required this.child,
    this.style = _defaultStyleBuilder,
    this.onClose,
    super.key,
  });

  final Widget child;
  final FlintUiBottomSheetStyle Function(FlintUiBottomSheetStyle style) style;
  final VoidCallback? onClose;

  static Future<dynamic> show(
    BuildContext context, {
    required Widget child,
    FlintUiBottomSheetStyle Function(FlintUiBottomSheetStyle style) style = _defaultStyleBuilder,
    VoidCallback? onClose,
  }) => showModalBottomSheet(
    useRootNavigator: true,
    useSafeArea: true,
    context: context,
    enableDrag: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.sizeOf(context).height * 0.9,
    ),
    builder: (context) => FlintUiBottomSheet(
      style: style,
      onClose: onClose,
      child: child,
    ),
  );

  bool get _showAppBar => onClose != null;

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = style(DefaultFlintUiBottomSheetStyle.of(context));

    return IntrinsicHeight(
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          if (_showAppBar) ...[
            GestureDetector(
              behavior: .translucent,
              onTap: onClose,
              child: Padding(
                padding: .symmetric(horizontal: context.themeData.spacing.md),
                child: FlintUiAppBar(
                  onClose: onClose,
                ),
              ),
            ),
          ],
          Expanded(
            child: Container(
              clipBehavior: .antiAlias,
              decoration: BoxDecoration(
                borderRadius: .all(.circular(resolvedStyle.borderRadius)),
                color: resolvedStyle.backgroundColor.color,
              ),
              child: Padding(
                padding: .symmetric(
                  horizontal: context.themeData.spacing.md,
                  vertical: context.themeData.spacing.md,
                ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    clipBehavior: .none,
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
