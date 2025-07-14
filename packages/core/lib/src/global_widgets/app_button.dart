import 'package:core/core.dart';
import 'package:core/src/global_widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/theme_state.dart';


enum AppButtonStyle {
  primary,
  secondary,
}

class AppElevatedButton extends StatefulWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    this.onDisabled,
    this.child,
    this.text,
    this.isLoading = false,
    this.sensitiveNetwork = false,
    this.appButtonStyle,
    this.textStyle,
    this.style,
  });

  final Function()? onPressed;
  final Function()? onDisabled;
  final Widget? child;
  final String? text;
  final bool isLoading;
  final AppButtonStyle? appButtonStyle;
  final ButtonStyle? style;
  final bool sensitiveNetwork;
  final TextStyle? textStyle;

  @override
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends ThemeState<AppElevatedButton> {
  ElevatedButtonThemeData? _buttonTheme;

  bool get absorbing => widget.onDisabled != null ? false : widget.isLoading;

  CrossFadeState get crossFadeState => widget.isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst;

  Function()? get onTap => widget.isLoading ? widget.onDisabled?.call() ?? () {} : widget.onPressed;

  @override
  Widget build(BuildContext context) {
    assert(() {
      if (widget.text == null && widget.child == null) {
        throw FlutterError("Can't be both text and child is null");
      }
      if (widget.style != null && widget.appButtonStyle != null) {
        throw FlutterError("Can't be pass both style and tripperButtonStyle");
      }
      return true;
    }());

    setButtonStyle();

    final child = ElevatedButton(
      onPressed: onTap,
      style: widget.style ?? _buttonTheme?.style,
      child: AnimatedCrossFade(
        firstChild: firstChild,
        secondChild: secondChild,
        duration:const Duration(milliseconds: 300),
        crossFadeState: crossFadeState,
      ),
    );

    return child;
  }

  Widget get secondChild => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      if (widget.isLoading) ...{
        8.horizontalSpace,
        const FittedBox(
          child: LoadingIndicator(),
        ),
        4.horizontalSpace,
      },
    ],
  );

  Widget get firstChild => FittedBox(
    fit: BoxFit.fitWidth,
    child: widget.child ??
        AppText(
          widget.text!,
          style: widget.textStyle,
        ),
  );

  void setButtonStyle() {
    final defaultElevatedTheme = theme.elevatedButtonTheme;

    final secondaryElevatedTheme = ElevatedButtonThemeData(
      style: widget.style ??
          ElevatedButton.styleFrom(
              shape: defaultElevatedTheme.style?.shape?.resolve({}),
              backgroundColor: Colors.transparent,
              foregroundColor: colorScheme.onSurface,
              elevation: 0.0,
              shadowColor: Colors.white.withOpacity(0.1),
              textStyle: widget.textStyle,
              side: BorderSide(color: context.colorScheme.tertiary.withOpacity(0.1), width: 0.7)),
    );

    final loadingElevatedTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: defaultElevatedTheme.style?.shape?.resolve({}),
        backgroundColor: colorScheme.surfaceContainerHighest,
        foregroundColor: colorScheme.outline,
        textStyle: widget.textStyle,
      ),
    );

    _buttonTheme = widget.isLoading
        ? loadingElevatedTheme
        : widget.appButtonStyle == AppButtonStyle.secondary
        ? secondaryElevatedTheme
        : defaultElevatedTheme;
  }
}
