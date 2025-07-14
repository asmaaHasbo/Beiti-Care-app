import 'package:beiti_care/common/models/response_wrapper/response_wrapper.dart';
import 'package:beiti_care/core/api/result.dart';
import 'package:beiti_care/feature/requests/data/model/session_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_utils.dart';
import '../../domain/repo/request_repository.dart';
import '../data_source/request_remote_data_source.dart';



@Injectable(as: RequestRepository)
class RequestRepositoryImpl extends RequestRepository {
  final RequestRemoteDataSource datasource;

  RequestRepositoryImpl({required this.datasource});



  @override
  Future<Result<ResponseWrapper<SessionsResponse>>> clientRequest() {
    return toApiResult(() async {
      final result = datasource.clientRequest();
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<bool>>> cancelSession(String id) {
    return toApiResult(() async {
      final result = datasource.cancelSession(id);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<bool>>> confirmSession(String id) {
    return toApiResult(() async {
      final result = datasource.acceptSession(id);
      return result;
    });
  }


}
