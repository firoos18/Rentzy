import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginEntity extends Equatable {
  final FirebaseAuthException? firebaseAuthException;
  final UserCredential? userCredential;

  const LoginEntity({this.firebaseAuthException, this.userCredential});

  @override
  List<Object?> get props => [firebaseAuthException, userCredential];
}
