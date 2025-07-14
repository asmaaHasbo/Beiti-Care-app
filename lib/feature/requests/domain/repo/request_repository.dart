



import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../data/model/session_model.dart';

abstract class RequestRepository {


  Future<Result<ResponseWrapper<SessionsResponse>>> clientRequest();
  Future<Result<ResponseWrapper<bool>>> confirmSession(String id);
  Future<Result<ResponseWrapper<bool>>> cancelSession(String id);




}
