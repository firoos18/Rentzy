part of 'available_date_bloc.dart';

sealed class AvailableDateEvent extends Equatable {
  final int? monthIndex;
  final String? unitId;

  const AvailableDateEvent({this.monthIndex, this.unitId});

  @override
  List<Object?> get props => [monthIndex, unitId];
}

final class OnSelectedMonth extends AvailableDateEvent {
  const OnSelectedMonth(final int? monthIndex) : super(monthIndex: monthIndex);
}
