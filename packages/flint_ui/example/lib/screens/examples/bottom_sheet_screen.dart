import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({super.key});

  static Future<dynamic> push(BuildContext context) => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (context) => BottomSheetScreen()));

  @override
  Widget build(BuildContext context) => FlintUiScaffold(
    header: FlintUiAppBar(titleText: 'UiBottomSheet', onGoBack: Navigator.of(context).pop),
    body: FlintUiFlex.column(
      divider: FlintUiGap.column(context.themeData.spacing.sm),
      children: [
        FlintUiButton(
          child: FlintUiText('Search users'),
          onPressed: () => FlintUiBottomSheet.show(
            context,
            onClose: Navigator.of(context).pop,
            child: FlintUiFlex.column(
              crossAxisAlignment: .stretch,
              divider: FlintUiGap.column(context.themeData.spacing.lg),
              children: [
                FlintUiField.text(
                  placeholderText: 'Dakpaneel#1124',
                  prefix: FlintUiIcon.search(),
                ),
                FlintUiFlex.column(
                  children: List.generate(
                    64,
                    (index) => FlintUiText(index.toString()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
