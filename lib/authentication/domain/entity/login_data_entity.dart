import 'package:equatable/equatable.dart';

class LoginDataEntity extends Equatable {
  final String? emailAddress;
  final String? password;

  const LoginDataEntity({this.emailAddress, this.password});

  @override
  List<Object?> get props => [emailAddress, password];
}
