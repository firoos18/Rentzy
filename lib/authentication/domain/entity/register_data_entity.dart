import 'package:equatable/equatable.dart';

class RegisterDataEntity extends Equatable {
  final String? emailAddress;
  final String? password;
  final String? rePassword;

  const RegisterDataEntity({this.emailAddress, this.password, this.rePassword});

  @override
  List<Object?> get props => [emailAddress, password, rePassword];
}
