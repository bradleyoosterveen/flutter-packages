import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flint_ui/flint_ui.dart';

class FlintUiUrlPreview extends StatelessWidget {
  const FlintUiUrlPreview({required this.url, super.key});

  final String url;

  void _onCopy() => Clipboard.setData(ClipboardData(text: url));

  @override
  Widget build(BuildContext context) => FlintUiCard(
    onPressed: _onCopy,
    child: FlintUiFlex.row(
      divider: FlintUiGap.row(context.themeData.spacing.xs),
      children: [
        Expanded(child: FlintUiText(url)),
        FlintUiIcon.clipboardCopy(),
      ],
    ),
  );
}
