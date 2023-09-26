import 'package:rentzy_rpl/authentication/domain/entity/register_data_entity.dart';
import 'package:rentzy_rpl/authentication/domain/entity/register_entity.dart';
import 'package:rentzy_rpl/authentication/domain/repository/auth_repository.dart';
import 'package:rentzy_rpl/core/usecases/usecases.dart';

class RegisterUseCase implements UseCase<RegisterEntity, RegisterDataEntity?> {
  final AuthenticationRepository authenticationRepository;

  RegisterUseCase(this.authenticationRepository);

  @override
  Future<RegisterEntity> call({RegisterDataEntity? params}) {
    return authenticationRepository.registerUser(registerData: params!);
  }
}
