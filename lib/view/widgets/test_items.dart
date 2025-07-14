// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:beiti_care/view/asmaa_response/response_model/reponse_model.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';


class TestItems extends StatelessWidget {
  final List testsFiles;
  const TestItems({super.key, required this.testsFiles});


  // Future<void> _downloadFile(
  //     String url, String? filename, BuildContext context) async {
  //   try {
  //     // 1. تحديد اسم الملف المقترح وامتداده
  //     // استخراج الامتداد من الـ URL أو تحديد اسم افتراضي
  //     String fileExtension = '.pdf'; // الامتداد الافتراضي
  //     if (url.contains('.')) {
  //       // التأكد من أن الامتداد لا يحتوي على علامات استفهام أو معلمات URL
  //       fileExtension = '.${url.split('.').last.split('?').first}';
  //     }
  //
  //     String defaultFileName = filename ?? 'downloaded_file';
  //     String suggestedFileName = '$defaultFileName$fileExtension';
  //
  //     // 2. طلب من المستخدم اختيار مكان حفظ الملف واسمه باستخدام saveFile()
  //     // هذه الدالة ستفتح واجهة نظام التشغيل لاختيار وحفظ الملف.
  //     // هي لا تتطلب أذونات صريحة مسبقة لأنها تستخدم Storage Access Framework (SAF).
  //     String? filePath = await FilePicker.platform.saveFile(
  //       dialogTitle: 'اختر مكان حفظ الملف',
  //       fileName: suggestedFileName, // يتم اقتراح اسم الملف والامتداد هنا
  //       type: FileType.custom,
  //       // يسمح بالامتدادات المحددة فقط (يجب إزالة النقطة من الامتداد هنا)
  //       allowedExtensions: [fileExtension.substring(1)],
  //     );
  //
  //     // 3. التحقق مما إذا كان المستخدم قد ألغى الاختيار
  //     if (filePath == null) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('تم إلغاء التنزيل: لم يتم اختيار مسار.')),
  //       );
  //       return;
  //     }
  //
  //     // 4. عرض رسالة للمستخدم بأن التنزيل قد بدأ
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('جاري تنزيل الملف إلى: $filePath')),
  //     );
  //
  //     // 5. تهيئة Dio وبدء التنزيل الفعلي
  //     final Dio dio = Dio(); // إنشاء مثيل جديد من Dio
  //
  //     // استخدام dio.download() لتنزيل الملف وحفظه مباشرة في المسار المحدد
  //     // filePath هنا يحتوي على المسار الكامل الذي اختاره المستخدم (المجلد + الاسم + الامتداد).
  //     await dio.download(
  //       url,
  //       filePath, // قم بتمرير filePath مباشرةً هنا. لا تقم بتعديله أو إضافة أي شيء آخر.
  //       onReceiveProgress: (received, total) {
  //         if (total != -1) {
  //           // يمكنك استخدام هذه الدالة لتحديث شريط التقدم في واجهة المستخدم
  //           double progress = (received / total) * 100;
  //           print('Progress: ${progress.toStringAsFixed(0)}%');
  //           // مثال: تحديث حالة UI لـ progress bar
  //           // setState(() { _downloadProgress = progress; });
  //         }
  //       },
  //     );
  //
  //     // 6. تأكيد نجاح التنزيل
  //     print('File downloaded successfully to: $filePath');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('تم تنزيل الملف بنجاح إلى: $filePath')),
  //     );
  //
  //   } on DioException catch (e) {
  //     // 7. التعامل مع الأخطاء الخاصة بـ Dio
  //     String errorMessage;
  //     if (e.type == DioExceptionType.cancel) {
  //       errorMessage = 'تم إلغاء التنزيل.';
  //     } else if (e.type == DioExceptionType.connectionError) {
  //       errorMessage = 'خطأ في الاتصال بالشبكة: ${e.message}';
  //     } else if (e.response != null) {
  //       errorMessage = 'فشل التنزيل: ${e.response?.statusCode ?? 'غير معروف'} - ${e.message}';
  //     } else {
  //       errorMessage = 'حدث خطأ غير متوقع أثناء التنزيل: ${e.message}';
  //     }
  //     print('Dio Error: $errorMessage');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(errorMessage)),
  //     );
  //   } catch (e) {
  //     // 8. التعامل مع أي أخطاء عامة أخرى
  //     print('General Error during download: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('حدث خطأ عام أثناء التنزيل: $e')),
  //     );
  //   }
  // }

  Future<void> _downloadFile(
      String ?url, String? filename, BuildContext context) async {
    try {
      // طلب إذن التخزين المناسب
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage, // للإصدارات القديمة
        Permission.manageExternalStorage, // للإصدارات الحديثة (Android 11+)
      ].request();

      if (statuses[Permission.storage]!.isGranted ||
          statuses[Permission.manageExternalStorage]!.isGranted) {


        if (url != null) {
          // تحديد مسار مجلد التنزيلات
          String downloadsPath = '/storage/emulated/0/Download/';

          // استخراج الامتداد من الـ URL أو تحديد اسم افتراضي
          String fileExtension = '.pdf'; // الامتداد الافتراضي
          if (url.contains('.')) {
            fileExtension = '.${url.split('.').last.split('?').first}';
          }
          final filePath = '$downloadsPath$filename$fileExtension';

          // التأكد من وجود المجلد، وإنشاؤه إذا لم يكن موجودًا
          final directory = Directory(downloadsPath);
          if (!await directory.exists()) {
            await directory.create(recursive: true);
          }

          // تنزيل الملف باستخدام Dio
          final dio = Dio();
          await dio.download(url, filePath);

          // عرض رسالة نجاح

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('File downloaded to Download/ $filename$fileExtension'.tr())),
          );

          print('File downloaded to $filePath');
        } else {
          print('there no file');
        }
      }

      //------------ مفيش اذن
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Storage permission denied')),
        );

        print('Storage permission denied');
      }
    } catch (e) {

      print('Error downloading file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: testsFiles.length,
        itemBuilder: (context, index) {
          
          
          
         final  file = testsFiles[index];
          // عرض "Unknown" إذا كان filename فارغًا أو null

          final displayFileName = file.testName?.isNotEmpty == true
              ? file.testName!
              : 'Unknown File Name';
          return Column(children: [
            Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF8B8B8B), width: 0.6)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      // Icon(
                      //   Icons.picture_as_pdf,
                      //   size: 24,
                      //   color: Color(0xFFB93439),
                      // ),
                      SizedBox(width: 5),
                      Text(
                        displayFileName,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF49768C),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      GestureDetector(
                        onTap: () => _downloadFile(
                            file.fileUrl, displayFileName, context),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFF49768C),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.download,
                            size: 22,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(height: 10)
          ]);
        });
  }
}
