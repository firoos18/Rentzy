import 'package:firebase_auth/firebase_auth.dart';
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
  Future<UserCredential> loginUsingEmailPassword({LoginDataEntity? loginData}) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginData?.emailAddress as String,
        password: loginData?.password as String);
  }

  @override
  Future<UserCredential> registerUser(
      {RegisterDataEntity? registerData}) async {
    try {
      if (registerData != null) {
        return await firebaseAuth.createUserWithEmailAndPassword(
          email: registerData.emailAddress!,
          password: registerData.password!,
        );
      } else {
        throw FirebaseAuthException(code: '');
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}
