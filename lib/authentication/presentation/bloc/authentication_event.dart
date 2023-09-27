part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  final String? emailAddress;
  final String? password;
  final String? rePassword;
  final User? user;

  const AuthenticationEvent(
      {this.emailAddress, this.password, this.rePassword, this.user});

  @override
  List<Object?> get props => [emailAddress, password, rePassword, user];
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

final class OnAppOpen extends AuthenticationEvent {
  const OnAppOpen(
    final User? user,
  ) : super(user: user);
}
