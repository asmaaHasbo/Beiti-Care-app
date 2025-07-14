import 'package:beiti_care/common/constants/route.dart';
import 'package:beiti_care/view/errors/exceptions.dart';
import 'package:beiti_care/view/screens/api/api_consumer.dart';
import 'package:beiti_care/view/screens/api/dio_consumer.dart';
import 'package:beiti_care/view/screens/data/compelete_profile_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'compelete_profile_state.dart';

class CompeleteProfileCubit extends Cubit<CompeleteProfileState> {
  final ApiConsumer api ; 
  CompeleteProfileCubit(this.api) : super(CompeleteProfileInitial());
  Future<void> getCompeleteProfile(String userId , CompleteProfileModel completeProfileModel) async {
    try{
      emit(CompeleteProfileLoading());
      final response = await api.patch(EndPoints.baseUrl + EndPoints.getCompeleteProfile +userId ,
       data:completeProfileModel.toJson()); 
      emit(CompeleteProfileLoaded());
    }on ServerException catch(e){
      emit(CompeleteProfileError(e.errorModel.errorMessage));
    }
  }

}
