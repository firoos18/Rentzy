import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentzy_rpl/authentication/domain/entity/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    final FirebaseAuthException? firebaseAuthException,
    final UserCredential? userCredential,
  }) : super(
          firebaseAuthException: firebaseAuthException,
          userCredential: userCredential,
        );
}
