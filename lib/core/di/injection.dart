import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:rentzy_rpl/authentication/data/repository/auth_repository_impl.dart';
import 'package:rentzy_rpl/authentication/domain/repository/auth_repository.dart';
import 'package:rentzy_rpl/authentication/domain/usecase/login_using_email_password_usecase.dart';
import 'package:rentzy_rpl/authentication/domain/usecase/on_app_open_usecase.dart';
import 'package:rentzy_rpl/authentication/domain/usecase/register_user_usecase.dart';
import 'package:rentzy_rpl/authentication/presentation/bloc/authentication_bloc.dart';

final injection = GetIt.instance;

Future<void> initializeDependencies() async {
// Firebase
  injection.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  // Repository
  injection.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(injection()));

  // Usecases
  injection.registerSingleton<LoginUsingEmailPasswordUseCase>(
      LoginUsingEmailPasswordUseCase(injection()));
  injection.registerSingleton<RegisterUseCase>(RegisterUseCase(injection()));
  injection.registerSingleton<OnAppOpenUsecase>(OnAppOpenUsecase(injection()));

  // BLoCs
  injection.registerFactory<AuthenticationBloc>(
    () => AuthenticationBloc(injection(), injection(), injection()),
  );
}
