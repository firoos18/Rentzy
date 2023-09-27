import 'package:rentzy_rpl/authentication/domain/entity/login_data_entity.dart';
import 'package:rentzy_rpl/authentication/domain/entity/login_entity.dart';
import 'package:rentzy_rpl/authentication/domain/entity/register_data_entity.dart';
import 'package:rentzy_rpl/authentication/domain/entity/register_entity.dart';

abstract class AuthenticationRepository {
  Future<LoginEntity> loginUsingEmailPassword({
    final LoginDataEntity loginData,
  });

  Future<RegisterEntity> registerUser({
    final RegisterDataEntity registerData,
  });

  Future<void> signOut();

  bool isAuthenticated();
}
