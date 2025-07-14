

import 'package:beiti_care/view/asmaa_response/response_model/reponse_model.dart';

abstract class ResponseState {}
final class ResponseInitial extends ResponseState {}



//-------------------- medical files state ----------

class MedicalFilesLoadingState extends ResponseState {}
class MedicalFilesNoDataState extends ResponseState {}
class MedicalFilesSuccessState extends ResponseState {
  final List<MedicalFileModel> medicalFiles;

  MedicalFilesSuccessState({required this.medicalFiles});
}
class MedicalFilesFailureState extends ResponseState {
  final String errorMsg;

  MedicalFilesFailureState({required this.errorMsg});
}

//-------------------- laboratory tests state ----------

class LaboratoryTestsLoadingState extends ResponseState {}
class LaboratoryTestsNoDataState extends ResponseState {}
class LaboratoryTestsSuccessState extends ResponseState {
  final List<LaboratoryTestModel>  laboratoryTests;

  LaboratoryTestsSuccessState({required this.laboratoryTests});
}
class LaboratoryTestsFailureState extends ResponseState {
  final String errorMsg;

  LaboratoryTestsFailureState({required this.errorMsg});
}

//-------------------- compareingFiles state ----------
class CompareingFilesLoadingState extends ResponseState {}
class CompareingFilesNoDataState extends ResponseState {}
class CompareingFilesSuccessState extends ResponseState {
  final  List<Map<String, dynamic>>filesWithXYValues;

  CompareingFilesSuccessState({required this.filesWithXYValues});
}
class CompareingFilesFailureState extends ResponseState {
  final String errorMsg;

  CompareingFilesFailureState({required this.errorMsg});
}


//--------------- log out state----------

class LogoutLoadingState extends ResponseState {}
class LogoutSuccessState extends ResponseState {}
class LogoutFailureState extends ResponseState {
  final String errorMsg;

  LogoutFailureState({required this.errorMsg});
}