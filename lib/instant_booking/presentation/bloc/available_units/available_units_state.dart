part of 'available_units_bloc.dart';

sealed class AvailableUnitsState extends Equatable {
  final List<UnitsEntity>? unitsList;

  const AvailableUnitsState({this.unitsList});

  @override
  List<Object?> get props => [unitsList];
}

final class AvailableUnitsInitial extends AvailableUnitsState {}

final class AvailableUnitsLoading extends AvailableUnitsState {}

final class AvailableUnitsLoaded extends AvailableUnitsState {
  const AvailableUnitsLoaded({final List<UnitsEntity>? unitsList})
      : super(unitsList: unitsList);
}

final class AvailableUnitsEmpty extends AvailableUnitsState {}
