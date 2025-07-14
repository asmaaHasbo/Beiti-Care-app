import 'package:beiti_care/common/constants/route.dart';
import 'package:beiti_care/view/errors/exceptions.dart';
import 'package:beiti_care/view/screens/api/api_consumer.dart';
import 'package:beiti_care/view/screens/data/session_response.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'clint_id_state.dart';

class ClintIdCubit extends Cubit<ClintIdState> {
  final ApiConsumer api ; 
  ClintIdCubit(this.api) : super(ClintIdInitial());

Future<void> getClientId(sessionId) async {
  try {
    emit(ClintIdLoading());
    final response = await api.put(EndPoints.baseUrl + EndPoints.getClientId+sessionId);
    SessionResponse sessionResponse = SessionResponse.fromJson(response);
    emit(ClintIdLoaded(sessionResponse));
  }on ServerException catch(e){
    emit(ClintIdError(e.errorModel.errorMessage));
  }
}

}

