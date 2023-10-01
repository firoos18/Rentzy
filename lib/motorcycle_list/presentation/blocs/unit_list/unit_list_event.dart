part of 'unit_list_bloc.dart';

sealed class UnitListEvent extends Equatable {
  final String? brandName;

  const UnitListEvent({this.brandName});

  @override
  List<Object?> get props => [brandName];
}

final class OnGetUnitData extends UnitListEvent {}

final class OnBrandFilterActive extends UnitListEvent {
  const OnBrandFilterActive({final String? brandName})
      : super(brandName: brandName);
}

final class OnBrandFilterDiactivate extends UnitListEvent {
  const OnBrandFilterDiactivate({final String? brandName})
      : super(brandName: brandName);
}
