import 'dart:async';

import 'package:flint_ui/flint_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FlintUiAlertOverlayController extends ChangeNotifier {
  FlintUiAlertState? _state;
  Timer? _dismissTimer;

  FlintUiAlertState? get state => _state;

  void add({
    required String title,
    required FlintUiAlertStyle style,
    String? body,
    FlintUiIcon? icon,
  }) {
    _dismissTimer?.cancel();

    _state = FlintUiAlertState(
      title: title,
      body: body,
      icon: icon,
      style: style,
      concurrencyStamp: DateTime.now().millisecondsSinceEpoch,
    );
    notifyListeners();

    _dismissTimer = Timer(const Duration(milliseconds: 3000), () {
      dismiss();
    });
  }

  void dismiss() {
    _dismissTimer?.cancel();
    _dismissTimer = null;
    _state = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    super.dispose();
  }
}

class FlintUiAlertState {
  final String title;
  final String? body;
  final FlintUiIcon? icon;
  final FlintUiAlertStyle? style;
  final int concurrencyStamp;

  const FlintUiAlertState({
    required this.title,
    this.body,
    this.icon,
    this.style,
    required this.concurrencyStamp,
  });
}

class FlintUiAlertOverlayNotifier extends InheritedNotifier<FlintUiAlertOverlayController> {
  const FlintUiAlertOverlayNotifier({
    required FlintUiAlertOverlayController controller,
    required super.child,
    super.key,
  }) : super(notifier: controller);

  static FlintUiAlertOverlayController of(BuildContext context) {
    final overlay = context.dependOnInheritedWidgetOfExactType<FlintUiAlertOverlayNotifier>()!;
    return overlay.notifier!;
  }
}

class FlintUiAlertOverlay extends StatefulWidget {
  const FlintUiAlertOverlay({required this.child, super.key});

  final Widget child;

  @override
  State<FlintUiAlertOverlay> createState() => _FlintUiAlertOverlayState();
}

class _FlintUiAlertOverlayState extends State<FlintUiAlertOverlay> {
  late final FlintUiAlertOverlayController _controller = FlintUiAlertOverlayController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FlintUiAlertOverlayNotifier(
    controller: _controller,
    child: Stack(
      children: [
        widget.child,
        Align(
          alignment: Alignment.topCenter,
          child: Builder(
            builder: (context) {
              final alert = FlintUiAlertOverlayNotifier.of(context).state;

              return AnimatedSwitcher(
                duration: 400.milliseconds,
                switchInCurve: Curves.easeInOutExpo,
                switchOutCurve: Curves.easeInOutExpo,
                transitionBuilder: (Widget child, Animation<double> animation) => SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1.0, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(animation),
                    child: child,
                  ),
                ),
                child: alert != null
                    ? SafeArea(
                        key: ValueKey(alert.concurrencyStamp),
                        child: Padding(
                          padding: .symmetric(
                            horizontal: context.themeData.spacing.md,
                            vertical: context.themeData.spacing.lg,
                          ),
                          child: Column(
                            mainAxisSize: .min,
                            children: [
                              FlintUiAlert(
                                title: alert.title,
                                body: alert.body,
                                icon: alert.icon,
                                style: (style) => alert.style ?? style,
                                onDismissed: () => _controller.dismiss(),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox.shrink(key: ValueKey('empty')),
              );
            },
          ),
        ),
      ],
    ),
  );
}
