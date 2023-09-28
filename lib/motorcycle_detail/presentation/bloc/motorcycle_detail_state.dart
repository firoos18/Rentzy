part of 'motorcycle_detail_bloc.dart';

sealed class MotorcycleDetailState extends Equatable {
  final List<int>? listOfDates;
  final List<String>? daysOfMonths;
  final int? monthIndex;

  const MotorcycleDetailState(
      {this.daysOfMonths, this.listOfDates, this.monthIndex});

  @override
  List<Object?> get props => [daysOfMonths, listOfDates, monthIndex];
}

final class MotorcycleDetailInitial extends MotorcycleDetailState {}

final class DataLoading extends MotorcycleDetailState {}

final class DateChanged extends MotorcycleDetailState {
  const DateChanged(final List<int>? listOfDates,
      final List<String>? daysOfMonths, final int monthIndex)
      : super(
          daysOfMonths: daysOfMonths,
          listOfDates: listOfDates,
          monthIndex: monthIndex,
        );
}
