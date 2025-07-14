import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textCapitalization,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign,
    this.textAlignVertical,
    this.autofocus,
    this.readOnly,
    this.showCursor,
    this.obscuringCharacter,
    this.obscureText,
    this.autocorrect,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions,
    this.maxLengthEnforcement,
    this.minLines,
    this.expands,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onEditingComplete,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.restorationId,
    this.mouseCursor,
    this.contextMenuBuilder,
    this.magnifierConfiguration,
    this.dragStartBehavior,
    this.contentInsertionConfiguration,
    this.description,
    this.label,
    this.suffixIcon,
    this.title,
    this.name,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.border,
    this.fillColor,
    this.enabled = true,
    this.enableInteractiveSelection = true,
    this.filled = true,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.isPasswordFiled = false,
    ///Custom Parameter
    this.hintText,
    this.hintStyle,
    this.hintMaxLines,
    this.hintTextDirection,
    this.alignLabelWithHint,
    this.margin,
    super.key,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.height,
    this.appKey,
    this.elevation = 2,
    this.isDense = false,
    this.constraints,
  });

  final GlobalKey<FormBuilderFieldState>? appKey;
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;

  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? constraints;
  final bool? autofocus;
  final bool? readOnly;
  final bool? showCursor;
  final String? obscuringCharacter;
  final bool? obscureText;
  final bool? autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool? enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int maxLines;

  final int? minLines;
  final bool? expands;
  final int? maxLength;
  final ValueChanged<String?>? onChanged;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double? cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets? scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final MouseCursor? mouseCursor;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? border;

  final DragStartBehavior? dragStartBehavior;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final EdgeInsets? margin;
  final String? description;
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? title;
  final double elevation;
  final String? name;
  final bool filled;
  final Color? fillColor;

  ///Custom Parameter
  ///when pass [decoration] this will be ignore [hintText,hintStyle,hintMaxLines,hintTextDirection,alignLabelWithHint]
  final String? hintText;
  final TextStyle? hintStyle;
  final int? hintMaxLines;
  final TextDirection? hintTextDirection;
  final bool? alignLabelWithHint;
  final bool? isDense;
  final bool isPasswordFiled;
  final double? height;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late final ValueNotifier<bool> obscureNotifier;

  @override
  void initState() {
    obscureNotifier = ValueNotifier(widget.isPasswordFiled);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureNotifier,
      builder:  (context, obscureValue, _)  {
        return Padding(
          padding: widget.margin ?? EdgeInsets.zero,
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.title != null) ...{AppText(widget.title!,style: TextStyle(fontSize: 30.sp,color: Colors.black),), 6.verticalSpace},
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Material(
                    elevation: widget.elevation,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    shadowColor: context.colorScheme.shadow.withOpacity(.2),
                    child: SizedBox(height: widget.minLines != null ? widget.height : 69.h),
                  ),
                  FormBuilderTextField(

                    key: widget.appKey,
                    name: widget.name ?? widget.label ?? '',
                    controller: widget.controller,
                    initialValue: widget.initialValue,
                    focusNode: widget.focusNode,
                    decoration: widget.decoration ??
                        InputDecoration(
                          errorStyle:TextStyle(fontSize: 20.sp,color: Colors.red) ,
                          isDense: true,
                          counter: const SizedBox.shrink(),
                          counterStyle: const TextStyle(height: 0),
                          label: widget.label != null ? AppText(widget.label!) : null,
                          hintText: widget.hintText,
                          hintStyle: widget.hintStyle ?? context.textTheme.bodyMedium?.copyWith(color: const Color(0xff98A2B3)),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          hintMaxLines: widget.hintMaxLines,
                          hintTextDirection: widget.hintTextDirection,
                          contentPadding: REdgeInsetsDirectional.only(start: 25, top: 20, bottom: 32,end: 25),
                          fillColor: widget.fillColor ?? context.colorScheme.onPrimary,
                          focusColor: context.colorScheme.surface,
                          alignLabelWithHint: widget.alignLabelWithHint,
                          suffixIcon:  widget.suffixIcon,
                          // suffixIconConstraints: BoxConstraints(maxHeight: 40.h, minHeight: 10.h, minWidth: 40.w),

                          constraints: widget.constraints ?? BoxConstraints(minHeight: 48.h),
                          prefixIconConstraints: widget.prefixIconConstraints ?? BoxConstraints(maxHeight: 40.h, minHeight: 10.h, minWidth: 40.w),
                          prefixIcon: widget.isPasswordFiled ? eyeIcon(widget.obscureText!,):widget.prefixIcon,
                          filled: widget.filled,
                          border: widget.border ??
                              OutlineInputBorder(
                                borderSide: BorderSide(color: context.colorScheme.primary),
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: context.colorScheme.primary),
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          enabledBorder: widget.enabledBorder ??
                              OutlineInputBorder(
                                borderSide: BorderSide(color: context.colorScheme.primary),
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                          focusedBorder: widget.focusedBorder ??
                              OutlineInputBorder(
                                borderSide: BorderSide(color: context.colorScheme.primary),
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                        ).applyDefaults(
                          context.theme.inputDecorationTheme.copyWith(alignLabelWithHint: widget.alignLabelWithHint),
                        ),
                    keyboardType: widget.keyboardType,
                    textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
                    textInputAction: widget.textInputAction,
                    style: TextStyle(fontSize: 30.sp,color: Colors.black),
                    strutStyle: widget.strutStyle,
                    textDirection: widget.textDirection,
                    textAlign: widget.textAlign ?? TextAlign.start,
                    textAlignVertical: widget.textAlignVertical,
                    autofocus: widget.autofocus ?? false,
                    readOnly: widget.readOnly ?? false,
                    showCursor: widget.showCursor,
                    obscuringCharacter: widget.obscuringCharacter ?? '•',
                    obscureText: widget.obscureText ?? false,
                    autocorrect: widget.autocorrect ?? true,
                    smartDashesType: widget.smartDashesType,
                    smartQuotesType: widget.smartQuotesType,
                    enableSuggestions: widget.enableSuggestions ?? true,
                    maxLengthEnforcement: widget.maxLengthEnforcement,
                    maxLines: widget.maxLines,
                    minLines: widget.minLines,


                    expands: widget.expands ?? false,
                    maxLength: widget.maxLength,
                    onChanged: widget.onChanged,
                    onTap: widget.onTap,
                    onTapOutside: widget.onTapOutside,
                    onEditingComplete: widget.onEditingComplete,
                    onSubmitted: widget.onSaved,
                    validator: widget.validator,
                    inputFormatters: widget.inputFormatters,
                    enabled: widget.enabled,
                    cursorWidth: widget.cursorWidth ?? 2.0,
                    cursorHeight: widget.cursorHeight,
                    cursorRadius: widget.cursorRadius,
                    cursorColor: widget.cursorColor,
                    keyboardAppearance: widget.keyboardAppearance,
                    scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20.0),
                    enableInteractiveSelection: true,
                    buildCounter: widget.buildCounter,
                    scrollPhysics: widget.scrollPhysics,
                    autofillHints: widget.autofillHints,
                    autovalidateMode: widget.autovalidateMode,
                    scrollController: widget.scrollController,
                    restorationId: widget.restorationId,
                    mouseCursor: widget.mouseCursor,
                    magnifierConfiguration: widget.magnifierConfiguration,
                    dragStartBehavior: widget.dragStartBehavior ?? DragStartBehavior.start,
                    contentInsertionConfiguration: widget.contentInsertionConfiguration,
                  ),
                ],
              ),
              if (widget.description != null) ...{
                AppText.regularText(
                  widget.description!,

                  color: const Color(0xff98A2B3),
                  fontWeight: FontWeight.w400,
                ),
                16.verticalSpace
              }
            ],
          ),
        );
      }
    );
  }

  Widget eyeIcon(bool obscure) {
    return Padding(
        padding: REdgeInsetsDirectional.only(start: 10,end:20),
        child: InkWell(
        onTap: () {
          print('batoul');
          print(obscure);

          obscureNotifier.value = !obscure;
          print(obscure);
        },
        child: Icon(obscure ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash, color: Colors.black.withOpacity(.5)),
      ),
    );
  }
}