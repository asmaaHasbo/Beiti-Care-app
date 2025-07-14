import 'dart:io';
import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../repo/auth_repository.dart';


@injectable
class RegisterUseCase extends UseCase<Result<ResponseWrapper<bool>>, RegisterParam> {
  RegisterUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(RegisterParam param) {
    return repository.registerNurse(param);
  }
}

class RegisterParam {
  final String name;
  final String email;
  final String password;
  final int typeId;
  final List<int> specializationId;
  final int nationalityId;
  final int gender;
  final int cityId;
  final String mobileNumber;
  final String workName;
  final String workAddress;
  final double latitude;
  final double longitude;
  final bool? showMobileNumber;
  final DateTime? birthDate;
  final String? birthPlace;
  final int? expertiseYears;
  final String? additionalInfo;
  final File? image;
  final bool isShowInJOb;
  RegisterParam({
    required this.name,
    required this.email,
    required this.password,
    required this.typeId,
    required this.specializationId,
    required this.nationalityId,
    required this.gender,
    required this.cityId,
    required this.mobileNumber,
    required this.workName,
    required this.workAddress,
    required this.longitude,
  required this.latitude,
    required this.isShowInJOb,
   this.additionalInfo,
   this.birthDate,
   this.birthPlace,
  required this.expertiseYears,
   this.showMobileNumber,
    this.image
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email':email,
      'password':password,
      'type_id':typeId,
      'specialization_ids':specializationId,
      'nationality_id':nationalityId,
      'gender':gender,
      'city_id':cityId,
      'mobile_number':mobileNumber,
      'work_name':workName,
      'work_address':workAddress,
      'additional_info':additionalInfo,
      'expertise_years':expertiseYears,
      'birth_place':birthPlace,
      'birth_date':birthDate?.toIso8601String().substring(0,10),
      'show_mobile_number':showMobileNumber,
      'longitude':longitude,
      'latitude':latitude,
      'image':image
    };
  }
}

