part of 'available_date_bloc.dart';

sealed class AvailableDateState extends Equatable {
  final List<int>? listOfDates;
  final List<String>? daysOfMonths;
  final int? monthIndex;

  const AvailableDateState(
      {this.daysOfMonths, this.listOfDates, this.monthIndex});

  @override
  List<Object?> get props => [daysOfMonths, listOfDates, monthIndex];
}

final class AvailableDateInitial extends AvailableDateState {}

final class DataLoading extends AvailableDateState {}

final class DateChanged extends AvailableDateState {
  const DateChanged(final List<int>? listOfDates,
      final List<String>? daysOfMonths, final int monthIndex)
      : super(
          daysOfMonths: daysOfMonths,
          listOfDates: listOfDates,
          monthIndex: monthIndex,
        );
}
