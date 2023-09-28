part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  final List<BrandFilterEntity>? brandsList;
  final List<UnitsEntity>? unitList;
  final FirebaseException? firebaseException;

  const HomeState({
    this.brandsList,
    this.firebaseException,
    this.unitList,
  });

  @override
  List<Object?> get props => [
        brandsList,
        firebaseException,
        unitList,
      ];
}

final class HomeInitial extends HomeState {}

final class Exception extends HomeState {
  const Exception(final FirebaseException? firebaseException)
      : super(firebaseException: firebaseException);
}

final class DataLoading extends HomeState {}

final class DataLoaded extends HomeState {
  const DataLoaded(final List<UnitsEntity>? unitList,
      final List<BrandFilterEntity>? brandsList)
      : super(brandsList: brandsList, unitList: unitList);
}
