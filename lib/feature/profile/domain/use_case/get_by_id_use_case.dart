import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/user_model.dart';
import '../repo/profile_repository.dart';
// import 'package:device_info_plus/device_info_plus.dart';

@injectable
class GetProfileByIdUseCase
    extends UseCase<Result<ResponseWrapper<UserModel>>, NoParams> {
  GetProfileByIdUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<Result<ResponseWrapper<UserModel>>> call(NoParams param) {
    return repository.getById();
  }
}

