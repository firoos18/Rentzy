part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  final String? accessToken;
  final FirebaseAuthException? firebaseAuthException;

  const AuthenticationState({this.accessToken, this.firebaseAuthException});

  @override
  List<Object?> get props => [accessToken, firebaseAuthException];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class Authenticated extends AuthenticationState {
  const Authenticated(final String? accessToken)
      : super(accessToken: accessToken);
}

final class Unauthenticated extends AuthenticationState {}

final class Registered extends AuthenticationState {}

final class Exception extends AuthenticationState {
  const Exception(final FirebaseAuthException firebaseAuthException)
      : super(firebaseAuthException: firebaseAuthException);
}
