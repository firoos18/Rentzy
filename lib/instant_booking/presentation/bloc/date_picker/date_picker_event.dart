part of 'date_picker_bloc.dart';

sealed class DatePickerEvent extends Equatable {
  final int? monthIndex;
  final String? unitId;

  const DatePickerEvent({this.monthIndex, this.unitId});

  @override
  List<Object?> get props => [monthIndex, unitId];
}

final class OnSelectedMonth extends DatePickerEvent {
  const OnSelectedMonth(final int? monthIndex) : super(monthIndex: monthIndex);
}
