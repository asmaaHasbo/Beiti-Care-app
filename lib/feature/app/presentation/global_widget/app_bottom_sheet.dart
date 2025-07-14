import 'package:core/core.dart';
import 'package:flutter/material.dart';


class AppBottomSheet<T> extends StatelessWidget {
  const AppBottomSheet._({
    super.key,
    required this.child,
    required this.showCloseIcon,
  });

  final Widget child;
  final bool showCloseIcon;

  static Future<T?> show<T>({
    required BuildContext context,
    required final Widget child,
    final bool? enableDrag,
    final bool? isDismissible,
    final bool? isScrollControlled,
    final Color? backgroundColor,
    final Color? barrierColor,
    final bool showCloseIcon = true,
  }) =>
      showModalBottomSheet<T>(
        context: context,
        enableDrag: enableDrag ?? true,
        isDismissible: isDismissible ?? true,
        isScrollControlled: isScrollControlled ?? true,
        barrierColor: barrierColor,
        backgroundColor: backgroundColor ?? context.colorScheme.surface,
        builder: (_) => AppBottomSheet._(showCloseIcon: showCloseIcon, child: child),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
      ],
    );
  }
}
