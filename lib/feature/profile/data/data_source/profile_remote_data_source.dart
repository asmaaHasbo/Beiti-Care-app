


import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/api/client.dart';
import '../../../../core/api/client_config.dart';
import '../../../../core/di/di_container.dart';
import '../../../app/domain/repo/preferences_repository.dart';
import '../../domain/use_case/edit_profile_use_case.dart';
import '../model/user_model.dart';

@injectable
class ProfileRemoteDataSource {
  final ClientApi clientApi;

  ProfileRemoteDataSource(this.clientApi);




  Future<ResponseWrapper<bool>> editProfile(RegisterParam params) async {
    FormData formData = FormData.fromMap({
      'userName': params.name,
      'email': params.email,
      'phone': params.mobileNumber,
      'password': params.password
    }..removeWhere((key, value) => value == null || value == ''));

    if (params.image != null) {
      final imagePath = params.image!.path;
      final extension = imagePath.split('.').last.toLowerCase();

      // Validate file extension
      final allowedExtensions = ['jpeg', 'jpg', 'png', 'mp4', 'mov', 'avi', 'pdf'];
      if (!allowedExtensions.contains(extension)) {
        throw Exception('Invalid file type. Only images (JPEG, PNG, JPG), videos (MP4, MOV, AVI) and PDFs are allowed.');
      }

      // Get the MIME type
      String mimeType;
      if (['jpeg', 'jpg', 'png'].contains(extension)) {
        mimeType = 'image/$extension';
      } else if (['mp4', 'mov', 'avi'].contains(extension)) {
        mimeType = 'video/$extension';
      } else if (extension == 'pdf') {
        mimeType = 'application/pdf';
      } else {
        mimeType = 'application/octet-stream';
      }

      formData.files.add(
        MapEntry(
          'image',
          await MultipartFile.fromFile(
            imagePath,
            filename: "image.$extension",
          ),
        ),
      );
    }

    return throwAppException(() async {

      String? id = await getIt<PreferencesRepository>().getString('idUser');
      final response = await clientApi.request(RequestConfig(
        endpoint: 'nurse/update/$id',
        data: formData,
        clientMethod: ClientMethod.patch,
      ));

      return ResponseWrapper.fromJson(
        response.data,
            (json) => true,
      );
    });
  }

  Future<ResponseWrapper<UserModel>> getProfile() async {
    return throwAppException(() async {
         String? id= getIt<PreferencesRepository>().getString('idUser');
      final response = await clientApi.request(RequestConfig(
        endpoint:'nurse/getNurse/$id',

        clientMethod: ClientMethod.get,
      ));

      return  ResponseWrapper.fromJson(
        response.data,
        (json) {

          return UserModel.fromJson(response.data , );
        },
      );
      
    });
  }






}
