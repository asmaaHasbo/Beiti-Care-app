import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/login_model.dart';
import '../repo/auth_repository.dart';
// import 'package:device_info_plus/device_info_plus.dart';

@injectable
class LoginUseCase
    extends UseCase<Result<ResponseWrapper<LoginModel>>, LoginParam> {
  LoginUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Result<ResponseWrapper<LoginModel>>> call(LoginParam param) {
    return repository.login(param.toMap());
  }
}

class LoginParam {
  final String email;
  final String password;
  // final String role;


  // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  LoginParam(
      {required this.email,
      required this.password,
        // required this.role,
      });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      // 'role' : role

    };
  }
}
