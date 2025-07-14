


import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/constants/prefs_key.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/api/client.dart';
import '../../../../core/api/client_config.dart';
import '../../../../core/di/di_container.dart';
import '../../../app/domain/repo/preferences_repository.dart';
import '../../domain/use_case/register_nurse_use_case.dart';
import '../model/login_model.dart';

@injectable
class AuthRemoteDataSource {
  final ClientApi clientApi;

  AuthRemoteDataSource(this.clientApi);

  Future<ResponseWrapper<bool>> verify(String params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint:'auth/sendOtp',
        data: {"phone":params
      },
        clientMethod: ClientMethod.post,
      ));
      return ResponseWrapper.fromJson(
        response.data,
        (json) {
          return true;
        },
      );
    });
  }




  Future<ResponseWrapper<bool>> register(RegisterParam params) async {
    FormData formData = FormData.fromMap({
      'name': params.name,
      'email': params.email,
      'password': params.password,
      'type_id': params.typeId,
      'specialization_ids':[  for (int i = 0; i < params.specializationId.length; i++)
        {
          params.specializationId[i]
        }.toList(),],
      'nationality_id': params.nationalityId,
      'gender': params.gender,
      'city_id': params.cityId,
      'mobile_number': params.mobileNumber,
      'work_name': params.workName,
      'work_address': params.workAddress,
      'additional_info': params.additionalInfo,
      'expertise_years': params.expertiseYears,
      'birth_place': params.birthPlace,
      'birth_date': params.birthDate?.toIso8601String().substring(0, 10),
      'show_mobile_number': params.showMobileNumber,
      'longitude': params.longitude,
      'latitude': params.latitude,
      'show_in_jobs': params.isShowInJOb
    });
    if (params.image != null) {
      formData.files.add(
          MapEntry('image', await MultipartFile.fromFile(params.image!.path,filename: "image.${params.image!.path.split('.').last}")));
    }
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: '',
        data: formData,
        clientMethod: ClientMethod.post,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          // getIt<PreferencesRepository>()
          //     .setInt(PrefsKey.idUser, response.data['data']['id']);
          return true;
        },
      );
    });
  }

  Future<ResponseWrapper<LoginModel>> login(Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint:'auth/login',
        data: params,
        clientMethod: ClientMethod.post,
      ));
      getIt<PreferencesRepository>().setString(PrefsKey.token, response.data['token']);
      getIt<PreferencesRepository>().setString('idUser', response.data['user']['id']);
      if (response.data['user']['role'] == "nurse") {
        getIt<PreferencesRepository>().setString('nurseRole', response.data['user']['role']);
      } else if (response.data['user']['role'] == "client") {
        getIt<PreferencesRepository>().setString('clientRole', response.data['user']['role']);

      }

        // getIt<PreferencesRepository>()
      //     .setString('userRole', response.data['user']['role']);

      return ResponseWrapper.fromJson(
        response.data,
        (json) {


          return LoginModel.fromJson(response.data);
        },
      );
    });
  }



  Future<ResponseWrapper<bool>> logout() async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint:'',
        clientMethod: ClientMethod.post,
      ));
      return ResponseWrapper<bool>.fromJson(
        response.data,
        (json) {
          return true;
        },
      );
    });
  }

  Future<ResponseWrapper<bool>> forgetPassword(String mobile) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint:'',
        data: {'mobile_number': mobile},
        clientMethod: ClientMethod.post,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return true;
        },
      );
    });
  }

  Future<ResponseWrapper<bool>> resetPassword(
      Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: 'auth/resetPassword',
        data: params
      ,
        clientMethod: ClientMethod.put,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return true;
        },
      );
    });
  }
}
