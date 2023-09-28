part of 'motorcycle_detail_bloc.dart';

sealed class MotorcycleDetailEvent extends Equatable {
  final int? monthIndex;

  const MotorcycleDetailEvent({this.monthIndex});

  @override
  List<Object?> get props => [monthIndex];
}

final class OnSelectedMonth extends MotorcycleDetailEvent {
  const OnSelectedMonth(final int? monthIndex) : super(monthIndex: monthIndex);
}
