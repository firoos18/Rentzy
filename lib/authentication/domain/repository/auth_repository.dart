import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentzy_rpl/authentication/domain/entity/login_data_entity.dart';
import 'package:rentzy_rpl/authentication/domain/entity/register_data_entity.dart';

abstract class AuthenticationRepository {
  Future<UserCredential> loginUsingEmailPassword({
    final LoginDataEntity loginData,
  });

  Future<UserCredential> registerUser({
    final RegisterDataEntity registerData,
  });

  Future<void> signOut();

  bool isAuthenticated();
}
