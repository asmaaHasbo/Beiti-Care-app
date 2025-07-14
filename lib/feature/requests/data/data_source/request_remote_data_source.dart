


import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/api/client.dart';
import '../../../../core/api/client_config.dart';
import '../../../../core/di/di_container.dart';
import '../../../app/domain/repo/preferences_repository.dart';
import '../model/session_model.dart';


@injectable
class RequestRemoteDataSource {
  final ClientApi clientApi;

  RequestRemoteDataSource(this.clientApi);




  Future<ResponseWrapper<bool>> cancelSession(String id) async {
    return throwAppException(() async {

      final response = await clientApi.request(RequestConfig(
        endpoint:'session/cancel/$id',

        clientMethod: ClientMethod.put,
      ));
      return ResponseWrapper.fromJson(
        response.data,
            (json) {


          return true;
        },
      );
    });
  }

  Future<ResponseWrapper<bool>> acceptSession(String id) async {
    return throwAppException(() async {

      final response = await clientApi.request(RequestConfig(
        endpoint:'session/confirm/$id',

        clientMethod: ClientMethod.put,
      ));
      return ResponseWrapper.fromJson(
        response.data,
            (json) {


          return true;
        },
      );
    });
  }

  Future<ResponseWrapper<SessionsResponse>> clientRequest() async {
    return throwAppException(() async {
    String? id= getIt<PreferencesRepository>()
          .getString('idUser');
      final response = await clientApi.request(RequestConfig(
        endpoint:'nurse/nurseSessions/$id',

        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        response.data,
        (json) {


          return SessionsResponse.fromJson(response.data);
        },
      );
    });
  }





}
