import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../repo/auth_repository.dart';


@injectable
class LogoutUseCase extends UseCase<Result<ResponseWrapper<bool>>, NoParams> {
  LogoutUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(NoParams param) {
    return repository.logout();
  }
}