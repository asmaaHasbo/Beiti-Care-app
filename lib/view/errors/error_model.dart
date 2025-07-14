
import 'package:beiti_care/view/asmaa_api/api_endpoints.dart';

class ErrorModel {
  final int status;
  final String errorMessage;
  final bool success;
  final String message;

  ErrorModel({required this.status,required  this.errorMessage  ,required this.success ,required this.message });

  factory ErrorModel.fromJson(jsonData) {
    return ErrorModel(
      status: jsonData[ApiKey.status]??0,
      errorMessage: jsonData[ApiKey.errorMessage]??'',
      success: jsonData[ApiKey.success]??false,
      message: jsonData[ApiKey.message]??'',
    );
  }
}
