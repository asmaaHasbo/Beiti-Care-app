import 'package:beiti_care/common/constants/route.dart';
import 'package:beiti_care/view/errors/exceptions.dart';
import 'package:beiti_care/view/screens/data/services_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../api/api_consumer.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ApiConsumer api ; 
  ServicesCubit(this.api) : super(ServicesInitial());

  Future<void> getServices() async {
  try {
    emit(ServicesLoading());
    final response = await api.get(EndPoints.baseUrl + EndPoints.getServices);

    final List<dynamic> servicesJson = response["services"];

    final List<ServiceModel> allServices = servicesJson
        .map((serviceJson) => ServiceModel.fromJson(serviceJson))
        .toList();

    emit(ServicesLoaded(allServices));
  } on ServerException catch (e) {
    emit(ServicesError(e.errorModel.errorMessage));
  } catch (e) {
    emit(ServicesError("An unexpected error occurred: $e"));
  }
}
}