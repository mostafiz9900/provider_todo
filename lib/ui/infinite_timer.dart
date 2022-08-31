import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

int useInfiniteTimer(BuildContext context) {
  return use(_InfiniteTimer());
}

class _InfiniteTimer extends Hook<int> {
  @override
  __InfiniteTimerState createState() => __InfiniteTimerState();
}

class __InfiniteTimerState extends HookState<int, _InfiniteTimer> {
  late Timer _time;
  int _number = 0;
  @override
  void initHook() {
    super.initHook();
    _time = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _number = timer.tick;
      },
    );
  }

  @override
  int build(BuildContext context) {
    return _number;
  }

  @override
  void dispose() {
    _time.cancel();
    super.dispose();
  }
}
