import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/brand_filter_entity.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/usecases/get_brands_list_usecase.dart';

part 'brand_filter_event.dart';
part 'brand_filter_state.dart';

class BrandFilterBloc extends Bloc<BrandFilterEvent, BrandFilterState> {
  final GetBrandsListUseCase getBrandsListUseCase;

  BrandFilterBloc(this.getBrandsListUseCase) : super(BrandFilterInitial()) {
    on<OnGetData>(ongetData);
  }

  void ongetData(OnGetData event, Emitter<BrandFilterState> emit) async {
    emit(DataLoading());

    final List<BrandFilterEntity> data =
        await getBrandsListUseCase.motorcycleRepository.getBrandFilterItem();

    emit(DataLoaded(brandFilterData: data));
  }
}
