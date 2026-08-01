import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/widgets.dart';

class FlintUiFieldGroup extends StatelessWidget {
  const FlintUiFieldGroup({
    required this.field,
    this.label,
    super.key,
  });

  final Widget field;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    final labelWidget = label;

    return FlintUiFlex.column(
      divider: FlintUiGap.column(context.themeData.spacing.xs),
      crossAxisAlignment: .stretch,
      children: [
        if (labelWidget != null) ...[
          Padding(
            padding: .symmetric(horizontal: context.themeData.spacing.sm),
            child: DefaultFlintUiTextStyle(
              style: context.themeData.textStyles.labelMedium,
              child: DefaultFlintUiFlexDivider(
                divider: FlintUiGap.row(context.themeData.spacing.xs),
                child: labelWidget,
              ),
            ),
          ),
        ],
        field,
      ],
    );
  }
}
