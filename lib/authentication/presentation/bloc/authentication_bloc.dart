import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rentzy_rpl/authentication/domain/entity/login_data_entity.dart';
import 'package:rentzy_rpl/authentication/domain/entity/register_data_entity.dart';
import 'package:rentzy_rpl/authentication/domain/usecase/login_using_email_password_usecase.dart';
import 'package:rentzy_rpl/authentication/domain/usecase/register_user_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  LoginUsingEmailPasswordUseCase loginUsingEmailPassword;
  RegisterUseCase registerUseCase;

  AuthenticationBloc(this.loginUsingEmailPassword, this.registerUseCase)
      : super(AuthenticationInitial()) {
    on<OnLogin>(onLogin);
    on<OnRegister>(onRegister);
  }

  void onLogin(OnLogin event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    UserCredential user = await loginUsingEmailPassword.authenticationRepository
        .loginUsingEmailPassword(
      loginData: LoginDataEntity(
          emailAddress: event.emailAddress, password: event.password),
    );

    if (loginUsingEmailPassword.authenticationRepository.isAuthenticated()) {
      emit(Authenticated(user.user?.uid));
    } else {
      emit(Unauthenticated());
    }
  }

  void onRegister(OnRegister event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    UserCredential user =
        await registerUseCase.authenticationRepository.registerUser(
      registerData: RegisterDataEntity(
          emailAddress: event.emailAddress, password: event.password),
    );

    if (user.user?.uid != null) {
      emit(Registered());
    } else {
      emit(AuthenticationInitial());
    }
  }
}
