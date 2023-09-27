import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rentzy_rpl/authentication/domain/entity/login_data_entity.dart';
import 'package:rentzy_rpl/authentication/domain/entity/login_entity.dart';
import 'package:rentzy_rpl/authentication/domain/entity/register_data_entity.dart';
import 'package:rentzy_rpl/authentication/domain/entity/register_entity.dart';
import 'package:rentzy_rpl/authentication/domain/usecase/login_using_email_password_usecase.dart';
import 'package:rentzy_rpl/authentication/domain/usecase/on_app_open_usecase.dart';
import 'package:rentzy_rpl/authentication/domain/usecase/register_user_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  LoginUsingEmailPasswordUseCase loginUsingEmailPassword;
  RegisterUseCase registerUseCase;
  OnAppOpenUsecase onAppOpenUsecase;

  AuthenticationBloc(
    this.loginUsingEmailPassword,
    this.registerUseCase,
    this.onAppOpenUsecase,
  ) : super(AuthenticationInitial()) {
    on<OnLogin>(onLogin);
    on<OnRegister>(onRegister);
    on<OnAppOpen>(onAppOpen);
  }

  void onLogin(OnLogin event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    final LoginEntity data = await loginUsingEmailPassword
        .authenticationRepository
        .loginUsingEmailPassword(
      loginData: LoginDataEntity(
          emailAddress: event.emailAddress, password: event.password),
    );

    if (data.userCredential?.user != null) {
      emit(Authenticated());
    } else {
      emit(Exception(data.firebaseAuthException!));
    }
  }

  void onRegister(OnRegister event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    final RegisterEntity data =
        await registerUseCase.authenticationRepository.registerUser(
      registerData: RegisterDataEntity(
          emailAddress: event.emailAddress, password: event.password),
    );

    if (data.userCredential?.user?.uid != null) {
      emit(Registered());
    } else {
      emit(Exception(data.firebaseAuthException!));
    }
  }

  void onAppOpen(OnAppOpen event, Emitter<AuthenticationState> emit) {
    final isAuthenticated =
        onAppOpenUsecase.authenticationRepository.isAuthenticated();

    if (isAuthenticated) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }
}
