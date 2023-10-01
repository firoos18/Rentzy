part of 'brand_filter_bloc.dart';

sealed class BrandFilterState extends Equatable {
  final List<BrandFilterEntity>? brandFilterData;

  const BrandFilterState({this.brandFilterData});

  @override
  List<Object?> get props => [brandFilterData];
}

final class BrandFilterInitial extends BrandFilterState {}

final class DataLoading extends BrandFilterState {}

final class DataLoaded extends BrandFilterState {
  const DataLoaded({final List<BrandFilterEntity>? brandFilterData})
      : super(brandFilterData: brandFilterData);
}
