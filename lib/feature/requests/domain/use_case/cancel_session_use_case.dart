import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../repo/request_repository.dart';
// import 'package:device_info_plus/device_info_plus.dart';

@injectable
class CancelSessionUseCase
    extends UseCase<Result<ResponseWrapper<bool>>, String> {
  CancelSessionUseCase(this.repository);

  final RequestRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(String param) {
    return repository.cancelSession(param);
  }
}

