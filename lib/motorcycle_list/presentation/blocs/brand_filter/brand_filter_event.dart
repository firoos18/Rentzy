part of 'brand_filter_bloc.dart';

sealed class BrandFilterEvent extends Equatable {
  const BrandFilterEvent();

  @override
  List<Object?> get props => [];
}

final class OnGetData extends BrandFilterEvent {}
