
import 'package:beiti_care/feature/app/presentation/global_page/empty_page.dart';
import 'package:beiti_care/feature/app/presentation/global_page/loading_page.dart';
import 'package:flutter/material.dart';

import 'page_state.dart';

class PageStateBuilder<T> extends StatelessWidget {
  const PageStateBuilder({
    super.key,
     this.init,
    required this.success,
     this.loading,
      this.error,
    required this.result,
     this.empty,
  });

  final PageState<T> result;
  final Widget? init;
  final Widget? loading;
  final Widget Function(T data) success;
  final Widget Function(Exception? error)? error;
  final Widget? empty;

  @override
  Widget build(BuildContext context) {
    late final Widget next;
    result.when(
      init: () => next = init ??  Container(),
      loading: () => next = loading ?? const LoadingPage(),
      loaded: (data) => next = success(data),
      error: (e, m) => next = error?.call(e) ??Container(),
      empty: () => next = empty ?? const EmptyPage(),
    );
    return next;
  }
}
