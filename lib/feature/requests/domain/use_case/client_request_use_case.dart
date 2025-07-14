import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/session_model.dart';
import '../repo/request_repository.dart';
// import 'package:device_info_plus/device_info_plus.dart';

@injectable
class ClientRequestUseCase
    extends UseCase<Result<ResponseWrapper<SessionsResponse>>, NoParams> {
  ClientRequestUseCase(this.repository);

  final RequestRepository repository;

  @override
  Future<Result<ResponseWrapper<SessionsResponse>>> call(NoParams param) {
    return repository.clientRequest();
  }
}

