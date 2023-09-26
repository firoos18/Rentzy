import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentzy_rpl/authentication/domain/entity/register_data_entity.dart';
import 'package:rentzy_rpl/authentication/domain/repository/auth_repository.dart';
import 'package:rentzy_rpl/core/usecases/usecases.dart';

class RegisterUseCase implements UseCase<UserCredential, RegisterDataEntity?> {
  final AuthenticationRepository authenticationRepository;

  RegisterUseCase(this.authenticationRepository);

  @override
  Future<UserCredential> call({RegisterDataEntity? params}) {
    return authenticationRepository.registerUser(registerData: params!);
  }
}
