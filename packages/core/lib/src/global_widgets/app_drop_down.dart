import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core.dart';
import '../theme/theme_state.dart';
import 'package:collection/collection.dart';


class AppDropDown<T> extends StatefulWidget {
  const AppDropDown({
    this.items = const [],
    this.onChange,
    this.onSaved,
    this.onTap,
    this.validator,
    this.hint,
    this.menuMaxHeight,
    this.icon,
    this.focusNode,
    super.key,
    this.value,
    this.title,
    this.isRate = false,
    this.isBorder=false,
    this.hintStyle,

  });

  final ValueChanged? onChange;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;
  final VoidCallback? onTap;
  final List<T> items;
  final String? hint;
  final double? menuMaxHeight;
  final Widget? icon;
  final FocusNode? focusNode;
  final T? value;
  final String? title;
  final bool isRate;
  final bool? isBorder;
  final TextStyle? hintStyle;
  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState<T> extends ThemeState<AppDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,

      items:
      widget.items.mapIndexed((index, e) => DropdownMenuItem<T>(value: e, child: buildItem(index, e))).toList(),
      onChanged: widget.onChange,
      onTap: widget.onTap,
      onSaved: widget.onSaved,
      validator: widget.validator,

       icon: const Icon(Icons.arrow_drop_down_outlined,color: Colors.black,) ?? const SizedBox.shrink(),

      focusNode: widget.focusNode,
      value: widget.value,
      dropdownColor: colorScheme.onPrimary,
      isDense: false,
      hint: widget.hint != null
          ? AppText(
        widget.hint!,
        style: widget.hintStyle??context.textTheme.titleMedium?.copyWith(color: Colors.black,fontSize: 30.sp))
          : null,
      style: context.textTheme.titleMedium?.copyWith(color: Colors.black,fontSize: 30.sp),
      decoration: InputDecoration(
        filled: true,
        fillColor:colorScheme.onPrimary,
        border: OutlineInputBorder(
          borderSide:(widget.isBorder)!?BorderSide.none: BorderSide(color: context.colorScheme.primary, width:1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: (widget.isBorder)!?BorderSide.none: BorderSide(color:  context.colorScheme.primary, width: 1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide: (widget.isBorder)!?BorderSide.none: BorderSide(color:  context.colorScheme.primary, width: 1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        disabledBorder:  OutlineInputBorder(
          borderSide: (widget.isBorder)!?BorderSide.none: BorderSide(color:  context.colorScheme.primary, width: 1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        errorBorder:  OutlineInputBorder(
          borderSide: (widget.isBorder)!?BorderSide.none: BorderSide(color:  context.colorScheme.primary, width: 1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderSide: (widget.isBorder)!?BorderSide.none: BorderSide(color:  context.colorScheme.primary, width: 1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        contentPadding: REdgeInsetsDirectional.only(start: 21, end: 12),

      ),
    );
  }

  buildItem(int index, dynamic item) {


    final text = Padding(
      padding: REdgeInsetsDirectional.only(start: 10),
      child: AppText(item is String ? item : item.name, style:context.textTheme.titleMedium?.copyWith(color: Colors.black,fontSize: 30.sp),),
    );

    return text;
  }
}
