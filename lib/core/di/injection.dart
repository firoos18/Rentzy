import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:rentzy_rpl/authentication/data/repository/auth_repository_impl.dart';
import 'package:rentzy_rpl/authentication/domain/repository/auth_repository.dart';
import 'package:rentzy_rpl/authentication/domain/usecase/login_using_email_password_usecase.dart';
import 'package:rentzy_rpl/authentication/domain/usecase/on_app_open_usecase.dart';
import 'package:rentzy_rpl/authentication/domain/usecase/register_user_usecase.dart';
import 'package:rentzy_rpl/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:rentzy_rpl/available_date/presentation/bloc/available_date_bloc.dart';
import 'package:rentzy_rpl/motorcycle_detail/presentation/bloc/unit_detail_bloc.dart';
import 'package:rentzy_rpl/motorcycle_list/data/datasource/brands_service.dart';
import 'package:rentzy_rpl/motorcycle_list/data/datasource/units_service.dart';
import 'package:rentzy_rpl/motorcycle_list/data/repository/motorcycle_list_repository_impl.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/repository/motorcycle_list_repository.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/usecases/get_brands_list_usecase.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/usecases/get_units_data_usecase.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/bloc/home_bloc.dart';
import 'package:rentzy_rpl/user_reviews/data/datasources/user_reviews_services.dart';
import 'package:rentzy_rpl/user_reviews/data/repository/user_reviews_repository_impl.dart';
import 'package:rentzy_rpl/user_reviews/domain/repository/user_reviews_repository.dart';
import 'package:rentzy_rpl/user_reviews/domain/usecases/get_user_reviews_usecases.dart';
import 'package:rentzy_rpl/user_reviews/presentation/bloc/user_reviews_bloc.dart';

final injection = GetIt.instance;

Future<void> initializeDependencies() async {
  // Firebase
  injection.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  injection.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  // Services
  injection.registerSingleton<BrandsService>(BrandsService(injection()));
  injection.registerSingleton<UnitsService>(UnitsService(injection()));
  injection
      .registerSingleton<UserReviewsServices>(UserReviewsServices(injection()));

  // Repository
  injection.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(injection()));
  injection.registerSingleton<MotorcycleRepository>(
    MotorCycleRepositoryImpl(injection(), injection()),
  );
  injection.registerSingleton<UserReviewsRepository>(
    UserReviewsRepositoryImpl(injection()),
  );

  // Usecases
  injection.registerSingleton<LoginUsingEmailPasswordUseCase>(
      LoginUsingEmailPasswordUseCase(injection()));
  injection.registerSingleton<RegisterUseCase>(RegisterUseCase(injection()));
  injection.registerSingleton<OnAppOpenUsecase>(OnAppOpenUsecase(injection()));
  injection.registerSingleton<GetBrandsListUseCase>(
      GetBrandsListUseCase(injection()));
  injection
      .registerSingleton<GetUnitsDataUseCase>(GetUnitsDataUseCase(injection()));
  injection.registerSingleton<GetUserReviewsUsecase>(
      GetUserReviewsUsecase(injection()));

  // BLoCs
  injection.registerFactory<AuthenticationBloc>(
    () => AuthenticationBloc(injection(), injection(), injection()),
  );
  injection.registerFactory<HomeBloc>(
    () => HomeBloc(injection(), injection()),
  );
  injection.registerFactory<UnitDetailBloc>(
    () => UnitDetailBloc(),
  );
  injection.registerFactory<AvailableDateBloc>(
    () => AvailableDateBloc(),
  );
  injection.registerFactory<UserReviewsBloc>(
    () => UserReviewsBloc(injection()),
  );
}
