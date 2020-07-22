import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

PageController usePageController({
  int initialPage = 0,
  bool keepPage = true,
  List<Object> keys,
}) {
  return use(
    _PageControllerHook(
      initialPage: initialPage,
      keepPage: keepPage,
      keys: keys,
    ),
  );
}

class _PageControllerHook extends Hook<PageController> {
  final int initialPage;
  final bool keepPage;

  _PageControllerHook({
    this.initialPage,
    this.keepPage,
    List<Object> keys,
  }) : super(keys: keys);

  @override
  HookState<PageController, Hook<PageController>> createState() =>
      _PageControllerHookState();
}

class _PageControllerHookState
    extends HookState<PageController, _PageControllerHook> {
  PageController controller;

  @override
  PageController build(BuildContext context) => controller;

  @override
  void initHook() {
    controller = PageController(
      initialPage: hook.initialPage,
      keepPage: hook.keepPage,
    );
  }

  @override
  void dispose() => controller.dispose();
}
