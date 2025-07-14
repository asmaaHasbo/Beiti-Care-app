import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../repo/auth_repository.dart';

@injectable
class ResetPasswordUseCase
    extends UseCase<Result<ResponseWrapper<bool>>, ResetPassowrdParam> {
  ResetPasswordUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(ResetPassowrdParam param) {
    return repository.resetPassword(param.toMap());
  }
}

class ResetPassowrdParam {
  final String phone;
  final String otp;
  final String newPassword;
  ResetPassowrdParam({
    required this.otp,
    required this.phone,
    required this.newPassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'phone':phone,
      'otp': otp,
      'newPassword':newPassword,
    };
  }
}
