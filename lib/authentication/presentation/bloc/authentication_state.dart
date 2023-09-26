part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  final String? accessToken;

  const AuthenticationState({this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class Authenticated extends AuthenticationState {
  const Authenticated(final String? accessToken)
      : super(accessToken: accessToken);
}

final class Unauthenticated extends AuthenticationState {}

final class Registered extends AuthenticationState {}
