part of 'available_units_bloc.dart';

sealed class AvailableUnitsEvent extends Equatable {
  final int? dayDate;
  final int? monthIndex;
  final int? year;

  const AvailableUnitsEvent({this.dayDate, this.monthIndex, this.year});

  @override
  List<Object?> get props => [dayDate, monthIndex, year];
}

final class OnDatePickerClicked extends AvailableUnitsEvent {
  const OnDatePickerClicked(
      {final int? dayDate, final int? monthIndex, final int? year})
      : super(dayDate: dayDate, monthIndex: monthIndex, year: year);
}

final class OnScreenChanged extends AvailableUnitsEvent {}
