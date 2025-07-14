import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../repo/auth_repository.dart';

@injectable
class VerifyUseCase
    extends UseCase<Result<ResponseWrapper<bool>>, String> {
  VerifyUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(String param) {
    return repository.verify(param);
  }
}

