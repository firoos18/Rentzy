part of 'date_picker_bloc.dart';

sealed class DatePickerState extends Equatable {
  final List<int>? listOfDates;
  final List<String>? daysOfMonths;
  final int? monthIndex;

  const DatePickerState({this.daysOfMonths, this.listOfDates, this.monthIndex});

  @override
  List<Object?> get props => [daysOfMonths, listOfDates, monthIndex];
}

final class AvailableDateInitial extends DatePickerState {}

final class DataLoading extends DatePickerState {}

final class DateChanged extends DatePickerState {
  const DateChanged(final List<int>? listOfDates,
      final List<String>? daysOfMonths, final int monthIndex)
      : super(
          daysOfMonths: daysOfMonths,
          listOfDates: listOfDates,
          monthIndex: monthIndex,
        );
}
