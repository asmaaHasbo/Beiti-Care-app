// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:beiti_care/common/constants/route.dart';
import 'package:beiti_care/view/screens/api/api_consumer.dart';
import 'package:beiti_care/view/errors/exceptions.dart';
import 'package:beiti_care/view/screens/data/creat_request_model.dart';
import 'package:beiti_care/view/screens/data/session_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  ApiConsumer api ;


  RequestsCubit(this.api) : super(RequestsInitial());

  Future<void> getRequests(userId) async {
    try {
      List<SessionModel> requestsList = [];
      emit(RequestsLoading());
      final response =
          await api.get(EndPoints.baseUrl + EndPoints.getRequests + userId);
      if (response.hashCode == 404) {
        emit(RequestsLoaded(
          weeklyRequests: [],
          monthlyRequests: [],
          annualRequests: [],
          requestsList: [],
        ));
      } else {
        requestsList = (response['sessions'] as List)
            .map((json) => SessionModel.fromJson(json))
            .toList();
print('requestsList length is ${requestsList.length}');
        // التاريخ الحالي 
        DateTime now = DateTime.now();

        // تصنيف الطلبات بناءً على createdAt
        List<SessionModel> weeklyRequests = [];
        List<SessionModel> monthlyRequests = [];
        List<SessionModel> annualRequests = [];

        for (var request in requestsList) {
          DateTime createdAt = request.createdAt;

          // Weekly: خلال آخر 7 أيام
          if (createdAt.isAfter(now.subtract(Duration(days: 7)))) {
            print('weekly is  ${weeklyRequests.length}');
            weeklyRequests.add(request);
          }

          // Monthly: خلال الشهر الحالي (من بداية الشهر)
          if (createdAt.year == now.year && createdAt.month == now.month) {
            print('monthly is  ${monthlyRequests.length}');

            monthlyRequests.add(request);
          }

          // Annual: خلال السنة الحالية
          if (createdAt.year == now.year) {
            print('annual is  ${annualRequests.length}');

            annualRequests.add(request);
          }
        }

        emit(RequestsLoaded(
            weeklyRequests: weeklyRequests,
            monthlyRequests: monthlyRequests,
            annualRequests: annualRequests,
            requestsList: requestsList));
      }
    } on ServerException catch (e) {
      emit(RequestsError(e.errorModel.errorMessage));
    }
  }

  Future<void> createRequest(CreateRequest createRequest) async {
    try {
      emit(LoadingCreateRequest());
      log(createRequest.toJson().toString());

      final response = await api.post(
        EndPoints.baseUrl + EndPoints.createRequest,
        data: createRequest.toJson(),
      );

      log(response.toString());
      emit(CreatedRequestState());
    } on ServerException catch (e) {
      emit(RequestsError(e.errorModel.errorMessage));
    }
  }

  Future<void> createEmergencySession(CreateRequest createRequest) async {
    try {
      emit(LoadingCreateRequest());
      log(createRequest.toJson().toString());

      final response = await api.post(
        EndPoints.baseUrl + EndPoints.createEmergencySession,
        data: createRequest.toJson(),
      );

      log(response.toString());
      emit(CreatedRequestState());
    } on ServerException catch (e) {
      emit(RequestsError(e.errorModel.errorMessage));
    }
  }
}


// import 'dart:developer';
//
// import 'package:beiti_care/common/constants/route.dart';
// import 'package:beiti_care/view/errors/exceptions.dart';
// import 'package:beiti_care/view/screens/data/creat_request_model.dart';
// import 'package:beiti_care/view/screens/data/session_model.dart' ;
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// import '../api/api_consumer.dart';
//
// part 'requests_state.dart';
//
// class RequestsCubit extends Cubit<RequestsState> {
//   ApiConsumer api ;
//
//   RequestsCubit(this.api) : super(RequestsInitial());
//   Future<void> getRequests(userId) async {
//     try {
//       emit(RequestsLoading());
//
//       final response = await api.get(EndPoints.baseUrl + EndPoints.getRequests + userId);
//
//       final requestsList = (response['sessions'] as List)
//           .map((json) => SessionModel.fromJson(json))
//           .toList();
//
//       emit(RequestsLoaded(requestsList));
//     } on ServerException catch (e) {
//       emit(RequestsError(e.errorModel.errorMessage));
//     }
//   }
//   Future<void> createRequest(CreatRequestModel createRequestModel) async {
//     try {
//       emit(LoadingCreateRequest());
//       log(createRequestModel.toJson().toString());
//
//       final response = await api.post(
//         EndPoints.baseUrl + EndPoints.createRequest,
//         data: createRequestModel.toJson(),
//       );
//
//       log(response.toString());
//       emit(
//           CreatedRequestState());
//     } on ServerException catch (e) {
//       emit(RequestsError(e.errorModel.errorMessage));
//     }
//   }
//
//
// }





