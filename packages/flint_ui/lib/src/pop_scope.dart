import 'package:flutter/widgets.dart';

class FlintUiPopScope<T> extends StatefulWidget {
  const FlintUiPopScope({
    super.key,
    required this.child,
    this.canPop = true,
    this.onPopInvokedWithResult,
  });

  factory FlintUiPopScope.disabled({
    required Widget child,
    PopInvokedWithResultCallback<T>? onPopInvokedWithResult,
  }) => FlintUiPopScope(
    canPop: false,
    onPopInvokedWithResult: onPopInvokedWithResult,
    child: child,
  );

  final Widget child;
  final bool canPop;
  final PopInvokedWithResultCallback<T>? onPopInvokedWithResult;

  @override
  State<FlintUiPopScope> createState() => _FlintUiPopScopeState();
}

class _FlintUiPopScopeState extends State<FlintUiPopScope> {
  @override
  Widget build(BuildContext context) => PopScope(
    canPop: widget.canPop,
    onPopInvokedWithResult: (didPop, result) => widget.onPopInvokedWithResult?.call(didPop, result),
    child: widget.child,
  );
}
