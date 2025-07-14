import 'package:beiti_care/common/constants/route.dart';
import 'package:beiti_care/view/screens/api/api_consumer.dart';
import 'package:beiti_care/view/screens/data/notification_model.dart';
import 'package:beiti_care/view/screens/errors/exceptions.dart';
import 'package:beiti_care/view/screens/cubit/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationState> {
  ApiConsumer api ;
  NotificationCubit(this.api) : super(NotificationInitial());

  Future<void> fetchNotifications(userId) async {
    emit(NotificationLoading());
    try {
      final response = await api.get( EndPoints.baseUrl + EndPoints.getNotifications +userId);
        final data = NotificationResponse.fromJson(response);
        emit(NotificationLoaded(data.notifications));
    
    } on ServerException catch(e) {

      emit(NotificationError(e.errModel.errorMessage));
    }
  }

}
