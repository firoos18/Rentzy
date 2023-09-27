import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserCredentialEntity extends Equatable {
  final User? user;
  final FirebaseAuthException? firebaseAuthException;

  const GetUserCredentialEntity({this.firebaseAuthException, this.user});

  @override
  List<Object?> get props => [user, firebaseAuthException];
}
