import 'dart:io';
import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../repo/profile_repository.dart';


@injectable
class EditrUseCase extends UseCase<Result<ResponseWrapper<bool>>, RegisterParam> {
  EditrUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(RegisterParam param) {
    return repository.updateNurse(param);
  }
}

class RegisterParam {
  final String? name;
  final String? email;
  final String? password;

  final String? mobileNumber;


  final File? image;

  RegisterParam({
     this.name,
     this.email,
     this.password,
this.mobileNumber,
    this.image
  });



}
