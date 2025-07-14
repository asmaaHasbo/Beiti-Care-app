



import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../data/model/user_model.dart';
import '../use_case/edit_profile_use_case.dart';

abstract class ProfileRepository {


  Future<Result<ResponseWrapper<bool>>> updateNurse(RegisterParam params);
  Future<Result<ResponseWrapper<UserModel>>> getById();



}
