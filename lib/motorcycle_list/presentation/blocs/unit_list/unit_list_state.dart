part of 'unit_list_bloc.dart';

sealed class UnitListState extends Equatable {
  final List<UnitsEntity>? unitList;

  const UnitListState({
    this.unitList,
  });

  @override
  List<Object?> get props => [
        unitList,
      ];
}

final class HomeInitial extends UnitListState {}

final class UnitDataLoading extends UnitListState {}

final class UnitDataLoaded extends UnitListState {
  const UnitDataLoaded(
    final List<UnitsEntity>? unitList,
  ) : super(unitList: unitList);
}

final class UnitDataEmpty extends UnitListState {}
