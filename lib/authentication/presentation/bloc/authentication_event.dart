part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  final String? emailAddress;
  final String? password;
  final String? rePassword;

  const AuthenticationEvent(
      {this.emailAddress, this.password, this.rePassword});

  @override
  List<Object?> get props => [emailAddress, password, rePassword];
}

final class OnLogin extends AuthenticationEvent {
  const OnLogin(
    final String? emailAddress,
    final String? password,
  ) : super(
          emailAddress: emailAddress,
          password: password,
        );
}

final class OnRegister extends AuthenticationEvent {
  const OnRegister(
    final String? emailAddress,
    final String? password,
    final String? rePassword,
  ) : super(
          emailAddress: emailAddress,
          password: password,
          rePassword: rePassword,
        );
}
