// ignore_for_file: avoid_print

import 'package:beiti_care/core/di/di_container.dart';
import 'package:beiti_care/feature/app/domain/repo/preferences_repository.dart';
import 'package:beiti_care/view/asmaa_api/api_consumer.dart';
import 'package:beiti_care/view/asmaa_api/api_endpoints.dart';
import 'package:beiti_care/view/asmaa_response/cubit/response_state.dart';
import 'package:beiti_care/view/asmaa_response/response_model/reponse_model.dart';
import 'package:beiti_care/view/errors/exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResponseCubit extends Cubit<ResponseState> {
  final ApiConsumer api;

  ResponseCubit(this.api) : super(ResponseInitial());

  final String? id = getIt<PreferencesRepository>().getString('idUser');

  UserResponseModel? _cachedUserResponse;

//----------  بدل ما عمل كل شويه طلب للبيانات  ال  cached  واستخدم ال cachedresponse  عشان احصل علي الداتا واخزنها في ال  get request  بعمل
 Future<void> fetchUserResponse() async {
  try {
    if (_cachedUserResponse != null) {
      print('response model is stored in cached');
      return;
    }
    if (id == null) {
      print('User ID is null');
      throw Exception('User ID is null');
    }
    final response = await api.get(AsmaaApiEndpoints.getProfileDataEndPoint(id));
    print('Raw response: $response');
    _cachedUserResponse = UserResponseModel.fromJson(response);
    print('User data fetched and cached successfully');
  } on ServerException catch (e) {
    print('ServerException error while fetching user data: ${e.errorModel.errorMessage}');
  } catch (e, stackTrace) {
    print('Unexpected error while fetching user data: $e\nStackTrace: $stackTrace');
  }
}
  // جلب الملفات الطبية
//---------------------------- get medical files ----------------
Future<void> getMedicalFiles() async {
  try {
    emit(MedicalFilesLoadingState());

    await fetchUserResponse();
    if (_cachedUserResponse == null) {
      print('Cached user response is null');
      emit(MedicalFilesFailureState(errorMsg: 'Failed to fetch user data'));
      return;
    }

    List<MedicalFileModel> medicalFiles = _cachedUserResponse!.user.medicalFiles;
    print('asmaa medicalFiles length is: ${medicalFiles.length}');

    if (medicalFiles.isEmpty) {
      print('medicalFiles list isEmpty');
      emit(MedicalFilesNoDataState());
    } else {
      print('asmaa medicalFiles length is: ${medicalFiles.length}');
      emit(MedicalFilesSuccessState(medicalFiles: medicalFiles));
    }
  } on ServerException catch (e) {
    print('MedicalFilesFailureState ${e.errorModel}');
    emit(MedicalFilesFailureState(errorMsg: e.errorModel.errorMessage));
  } catch (e, stackTrace) {
    print('Unexpected error MedicalFiles function: $e\nStackTrace: $stackTrace');
    emit(MedicalFilesFailureState(errorMsg: e.toString()));
  }
}
//--------------------------- get laboratoryTests ----------

  getLaboratoryTests() async {
    try {
      emit(LaboratoryTestsLoadingState());
      await fetchUserResponse();

      List<LaboratoryTestModel> laboratoryTests =
          _cachedUserResponse!.user.medicalHistory.laboratoryTests;

      if (laboratoryTests.isEmpty) {
        print('laboratoryTests list isEmpty');
        emit(LaboratoryTestsNoDataState());
      } else {
        print('laboratoryTests list length is ${laboratoryTests.length} ');
        print('laboratoryTests list length is ${laboratoryTests[0].testName} ');

        emit(LaboratoryTestsSuccessState(laboratoryTests: laboratoryTests));
      }
    } on ServerException catch (e) {
      print('LaboratoryTestsFailureState error is ${e.errorModel}');
      emit(LaboratoryTestsFailureState(errorMsg: e.errorModel.errorMessage));
    } catch (e) {
      print('Unexpected error laportary function: ${e.toString()}');
    }
  }

//-------------------------- get compareingFiles---------------

Future<void> getListOfCompareingFiles() async {
  try {
    emit(CompareingFilesLoadingState());
    await fetchUserResponse();
    if (_cachedUserResponse == null) {
      print('Cached user response is null');
      emit(CompareingFilesFailureState(errorMsg: 'Failed to fetch user data'));
      return;
    }

    final List<PreviousTestComparisonModel> compareingFiles =
        _cachedUserResponse!.user.previousMedications.previousTestComparisons;
    final List<Map<String, dynamic>> filesWithXYValues =
        getListOfSpotsFromtestsResultKey(compareingFiles);
    print('filesWithXYValue length is ${filesWithXYValues.length}');

    emit(CompareingFilesSuccessState(filesWithXYValues: filesWithXYValues));
    print('CompareingFilesSuccessState');
  } on ServerException catch (e) {
    print('CompareingFilesFailureState ${e.errorModel}');
    emit(CompareingFilesFailureState(errorMsg: e.errorModel.errorMessage));
  } catch (e, stackTrace) {
    print('Unexpected error CompareingFiles function: $e\nStackTrace: $stackTrace');
    emit(CompareingFilesFailureState(errorMsg: e.toString()));
  }
}
//------------------------get list of  x and y values

  List<Map<String, dynamic>> getListOfSpotsFromtestsResultKey(
      List<PreviousTestComparisonModel> previousTestComparisons) {
    //------- الليسته اللي فيها  ال result

    print('previousTestComparisons ${previousTestComparisons.length}');

    //-------------   بتاعت الفور لوب وهعبي قميه ال الراسي  من الريزلت i  اللي هي ال  x  ليسته هعبي فيها اسم التيست و قميه ال
    final List<Map<String, dynamic>> listIncoludedTestsXYValues = [];

    for (var test in previousTestComparisons) {
      List result = test.results;
      for (var i = 0; i < result.length; i++) {
        listIncoludedTestsXYValues.add({
          'X': i,
          'Y': result[i],
          'testName': test.testName,
        });
      }
      print('result values is : $result');
    }
    print('ListIncoludedTestsXYValues ${listIncoludedTestsXYValues[0]['y']}');
    return listIncoludedTestsXYValues;
  }

//-------------------- log out function ------------
  Future<void> logout() async {
    try {
      print('Starting logout process');
      emit(LogoutLoadingState());
      // إرسال طلب POST إلى الـ API
      await api.post(AsmaaApiEndpoints.logOutEndPoint);

      // مسح البيانات المحلية
      await getIt<PreferencesRepository>().clearAll();

      _cachedUserResponse = null;

      print('User logged out successfully');
      emit(LogoutSuccessState());
    } on ServerException catch (e) {
      final errorMessage = e.errorModel.errorMessage.isNotEmpty
          ? e.errorModel.errorMessage
          : 'failed';
      print('Logout failed: $errorMessage');
      emit(LogoutFailureState(errorMsg: errorMessage));
    } catch (e) {
      print('Unexpected error during logout: $e');
      emit(LogoutFailureState(errorMsg: 'Unexpected error during logout: $e'));
    }
  }
}
