part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  final int? monthIndex;

  const HomeEvent({this.monthIndex});

  @override
  List<Object?> get props => [monthIndex];
}

final class OnGetData extends HomeEvent {}
