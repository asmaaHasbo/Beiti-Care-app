import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchWidget extends StatefulWidget {
  const CustomSearchWidget({
    super.key,
    required this.searchFieldName,
    required this.hint,
  });

  final String searchFieldName;
  final String hint;

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  final TextEditingController controller = TextEditingController();

  //------------------ العناصر المتاحه ------------------
  final List<String> allServices = [
    'Nutrition'.tr(),
    'Catheterization'.tr(),
    'Consultations'.tr(),
    'Catheterization'.tr(),
    'Catheterization'.tr(),
    'Consultations'.tr(),
  ];

  List<String> filteredList = [];

  //-----------  داله بتاعت ال  on chanage بتاعت ال text form
  bool showSuggestions = false;

  void onChange(String query) {
    //------------- لو مفيش input فضي ال filterd list
    if (query.isEmpty) {
      setState(() {
        filteredList = [];
      });
      return;
    }

    //---------------------- لو الحرف اللي في السرش موجوده في اي كلمه من الكلمات اللي في الليست حط بقي الكلمات دي في ليست جديده
    final suggestions = allServices
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    //------------ اعمل update لل filterdlist عللي حسب ال suggestion list لو فاضيه
    setState(() {
      filteredList = suggestions.isEmpty ? ['Not found'.tr()] : suggestions;
      showSuggestions = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //------------------ Label ----------------
        Padding(
          padding:  EdgeInsets.only(bottom: 10.h),
          child: Text(
            widget.searchFieldName,
            style:  TextStyle(
              fontSize: 18.sp,
              color: Color(0xFF5E5C5C),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // ----------------- text Field -------------
        TextField(
          controller: controller,
          onChanged: onChange,
          decoration: InputDecoration(
            hintText: widget.hint,
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ).copyWith(
              color: const Color(0xffA7A5A5),
            ),
            contentPadding:  EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 12.w,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:  BorderSide(
                color: Color(0xff8B8B8B),
                width: 0.6.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:  BorderSide(
                color: Color(0xff8B8B8B),
                width: 0.6.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:  BorderSide(
                color: Color(0xff8B8B8B),
                width: 0.6.w,
              ),
            ),
          ),
        ),

        //----------------- Suggestions List---------------
        //  ------- لو بدا يبحث اظهر ال ال container دا اللي اصلا جواه list vie بالعناصر الموجوده
        if (showSuggestions)
          Container(
            padding:  EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:  BorderRadius.only(
                bottomRight: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
              border: Border.all(color: const Color(0xff8B8B8B)),
            ),
            //-----------------------  list view -------------
            child: SizedBox(
              height: 200.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final currentItem = filteredList[index];
                  final isFirst = index == 0;
                  final isNotFound = currentItem == 'Not found'.tr();

                  return GestureDetector(
                    onTap: () {
                      if (!isNotFound) {
                        // ✨ حط العنصر في الـ input
                        controller.text = currentItem;

                        // ✨ اخفي الليست بعد الاختيار
                        setState(() {
                          filteredList = [];
                        });
                        // ✨ شيل المؤشر (الكيبورد يقفل كمان)
                        FocusScope.of(context).unfocus();

                        showSuggestions = false;
                      }
                    },
                    child: Padding(
                      padding: isFirst
                          ?  EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            )
                          : EdgeInsets.zero,
                      child: Container(
                        decoration: BoxDecoration(
                          color: isNotFound
                              ? Colors.white
                              : isFirst
                                  ? Color(0xFF49768C)
                                  : Colors.white,
                          borderRadius: isNotFound
                              ? BorderRadius.zero
                              : isFirst
                                  ? BorderRadius.circular(8.r)
                                  : BorderRadius.zero,
                        ),
                        padding: isFirst
                            ?  EdgeInsets.all(12.w)
                            :  EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 5.h,
                              ),
                        child: Text(
                          currentItem,
                          style: TextStyle(
                            color: isNotFound
                                ? Colors.red
                                : isFirst
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: isNotFound ? 18.sp : 14.sp,
                          ),
                          textAlign:
                              isNotFound ? TextAlign.center : TextAlign.start,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
