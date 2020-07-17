import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// we can't extend _ScrollControllerHook... So we are copying it and adding
/// our extension here...
/// Used for firing a callback when scrolling to the end of list
ScrollController useScrollControllerEnd({
  double initialScrollOffset = 0.0,
  bool keepScrollOffset = true,
  String debugLabel,
  List<Object> keys,
  VoidCallback onScrollEnd,
}) {
  return use(
    _ScrollControllerEndHook(
      initialScrollOffset: initialScrollOffset,
      keepScrollOffset: keepScrollOffset,
      debugLabel: debugLabel,
      keys: keys,
      onScrollEnd: onScrollEnd,
    ),
  );
}

class _ScrollControllerEndHook extends Hook<ScrollController> {
  const _ScrollControllerEndHook({
    this.initialScrollOffset,
    this.keepScrollOffset,
    this.debugLabel,
    this.onScrollEnd,
    List<Object> keys,
  }) : super(keys: keys);

  final double initialScrollOffset;
  final bool keepScrollOffset;
  final String debugLabel;
  final VoidCallback onScrollEnd;

  @override
  HookState<ScrollController, Hook<ScrollController>> createState() =>
      _ScrollControllerEndHookState();
}

class _ScrollControllerEndHookState
    extends HookState<ScrollController, _ScrollControllerEndHook> {
  ScrollController controller;

  @override
  void initHook() {
    controller = ScrollController(
      initialScrollOffset: hook.initialScrollOffset,
      keepScrollOffset: hook.keepScrollOffset,
      debugLabel: hook.debugLabel,
    );
    // Fire the callback on scrolling to the end of the list
    controller.addListener(() {
      if (controller.position.pixels >= controller.position.maxScrollExtent) {
        hook.onScrollEnd();
      }
    });
  }

  @override
  ScrollController build(BuildContext context) => controller;

  @override
  void dispose() => controller.dispose();
}
