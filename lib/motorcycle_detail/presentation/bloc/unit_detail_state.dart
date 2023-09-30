part of 'unit_detail_bloc.dart';

sealed class UnitDetailState extends Equatable {
  const UnitDetailState();

  @override
  List<Object?> get props => [];
}

final class MotorcycleDetailInitial extends UnitDetailState {}
