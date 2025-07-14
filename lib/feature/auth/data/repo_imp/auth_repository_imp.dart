import 'package:beiti_care/common/models/response_wrapper/response_wrapper.dart';
import 'package:beiti_care/core/api/result.dart';
import 'package:beiti_care/feature/auth/domain/use_case/register_nurse_use_case.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_utils.dart';
import '../../domain/repo/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';
import '../model/login_model.dart';



@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource datasource;

  AuthRepositoryImpl({required this.datasource});






  @override
  Future<Result<ResponseWrapper<bool>>> logout() {
    return toApiResult(() async {
      final result = datasource.logout();
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<LoginModel>>> login(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.login(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<bool>>> forgetPassword(String email) {
    return toApiResult(() async {
      final result = datasource.forgetPassword(email);
      return result;
    });
  }




  @override
  Future<Result<ResponseWrapper<bool>>> verify(String params) {
    return toApiResult(() async {
      final result = datasource.verify(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<bool>>> resetPassword(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.resetPassword(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<bool>>> registerClient(RegisterParam params) {
    // TODO: implement registerClient
    throw UnimplementedError();
  }

  @override
  Future<Result<ResponseWrapper<bool>>> registerNurse(RegisterParam params) {
    // TODO: implement registerNurse
    throw UnimplementedError();
  }


}
