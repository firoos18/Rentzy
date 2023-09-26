import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterEntity extends Equatable {
  final FirebaseAuthException? firebaseAuthException;
  final UserCredential? userCredential;

  const RegisterEntity({this.firebaseAuthException, this.userCredential});

  @override
  List<Object?> get props => [firebaseAuthException, userCredential];
}
