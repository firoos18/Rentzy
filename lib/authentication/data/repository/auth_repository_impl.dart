import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentzy_rpl/authentication/data/models/login_model.dart';
import 'package:rentzy_rpl/authentication/data/models/register_model.dart';
import 'package:rentzy_rpl/authentication/domain/entity/login_data_entity.dart';
import 'package:rentzy_rpl/authentication/domain/entity/register_data_entity.dart';
import 'package:rentzy_rpl/authentication/domain/repository/auth_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuth firebaseAuth;

  AuthenticationRepositoryImpl(this.firebaseAuth);

  @override
  bool isAuthenticated() {
    final currentUser = FirebaseAuth.instance.currentUser;
    return currentUser != null;
  }

  @override
  Future<LoginModel> loginUsingEmailPassword(
      {LoginDataEntity? loginData}) async {
    try {
      if (loginData != null) {
        final UserCredential userCredential =
            await firebaseAuth.signInWithEmailAndPassword(
                email: loginData.emailAddress!, password: loginData.password!);

        return LoginModel(userCredential: userCredential);
      } else {
        return LoginModel(
            firebaseAuthException: FirebaseAuthException(code: 'unknown'));
      }
    } on FirebaseAuthException catch (e) {
      return LoginModel(
          firebaseAuthException: FirebaseAuthException(code: e.code));
    }
  }

  @override
  Future<RegisterModel> registerUser({RegisterDataEntity? registerData}) async {
    try {
      if (registerData != null) {
        final UserCredential userCredential =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: registerData.emailAddress!,
          password: registerData.password!,
        );

        return RegisterModel(userCredential: userCredential);
      } else {
        return RegisterModel(
          firebaseAuthException: FirebaseAuthException(code: 'unknown'),
        );
      }
    } on FirebaseAuthException catch (e) {
      return RegisterModel(
        firebaseAuthException: FirebaseAuthException(code: e.code),
      );
    }
  }

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}
