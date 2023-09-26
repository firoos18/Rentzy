import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentzy_rpl/authentication/domain/entity/login_data_entity.dart';
import 'package:rentzy_rpl/authentication/domain/repository/auth_repository.dart';
import 'package:rentzy_rpl/core/usecases/usecases.dart';

class LoginUsingEmailPasswordUseCase
    implements UseCase<UserCredential, LoginDataEntity?> {
  final AuthenticationRepository authenticationRepository;
  LoginUsingEmailPasswordUseCase(this.authenticationRepository);

  @override
  Future<UserCredential> call({LoginDataEntity? params}) {
    return authenticationRepository.loginUsingEmailPassword(loginData: params!);
  }
}
