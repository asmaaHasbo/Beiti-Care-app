import 'package:beiti_care/common/models/response_wrapper/response_wrapper.dart';
import 'package:beiti_care/core/api/result.dart';
import 'package:beiti_care/feature/profile/domain/use_case/edit_profile_use_case.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_utils.dart';
import '../../domain/repo/profile_repository.dart';
import '../data_source/profile_remote_data_source.dart';
import '../model/user_model.dart';



@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource datasource;

  ProfileRepositoryImpl({required this.datasource});








  @override
  Future<Result<ResponseWrapper<UserModel>>> getById() {
    return toApiResult(() async {
      final result = datasource.getProfile();
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<bool>>> updateNurse(RegisterParam params) {
    return toApiResult(() async {
      final result = datasource.editProfile(params);
      return result;
    });
  }


}
