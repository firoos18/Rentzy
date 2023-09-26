import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentzy_rpl/authentication/domain/entity/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel(
      {final FirebaseAuthException? firebaseAuthException,
      final UserCredential? userCredential})
      : super(
            firebaseAuthException: firebaseAuthException,
            userCredential: userCredential);
}
