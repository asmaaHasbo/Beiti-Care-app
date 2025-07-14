



import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../data/model/login_model.dart';
import '../use_case/register_nurse_use_case.dart';

abstract class AuthRepository {


  Future<Result<ResponseWrapper<bool>>> registerNurse(RegisterParam params);
  Future<Result<ResponseWrapper<bool>>> registerClient(RegisterParam params);

  //Login
  Future<Result<ResponseWrapper<bool>>> logout();
  Future<Result<ResponseWrapper<LoginModel>>> login(Map<String, dynamic> params);

  //Forget password
  Future<Result<ResponseWrapper<bool>>> forgetPassword(String mobile);
  Future<Result<ResponseWrapper<bool>>> resetPassword(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<bool>>> verify(String params);


}
