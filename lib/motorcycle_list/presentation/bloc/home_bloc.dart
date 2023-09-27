import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/brand_filter_entity.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/units_entity.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/usecases/get_brands_list_usecase.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/usecases/get_units_data_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBrandsListUseCase getBrandsListUseCase;
  final GetUnitsDataUseCase getUnitsDataUseCase;

  HomeBloc(this.getBrandsListUseCase, this.getUnitsDataUseCase)
      : super(HomeInitial()) {
    on<OnGetData>(onGetData);
  }

  void onGetData(OnGetData event, Emitter<HomeState> emit) async {
    emit(DataLoading());

    final List<UnitsEntity> unitList =
        await getUnitsDataUseCase.motorcycleRepository.getUnitsData();

    final List<BrandFilterEntity> brandsList =
        await getBrandsListUseCase.motorcycleRepository.getBrandFilterItem();

    if (brandsList.isNotEmpty && unitList.isNotEmpty) {
      emit(DataLoaded(unitList, brandsList));
    }
  }
}
