import 'package:rentzy_rpl/authentication/domain/repository/auth_repository.dart';
import 'package:rentzy_rpl/core/usecases/usecases.dart';

class OnAppOpenUsecase extends UseCase<bool, void> {
  final AuthenticationRepository authenticationRepository;

  OnAppOpenUsecase(this.authenticationRepository);

  @override
  Future<bool> call({void params}) async {
    return authenticationRepository.isAuthenticated();
  }
}
