import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/units_entity.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/usecases/get_unit_by_brand_usecase.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/usecases/get_units_data_usecase.dart';

part 'unit_list_event.dart';
part 'unit_list_state.dart';

class UnitListBloc extends Bloc<UnitListEvent, UnitListState> {
  final GetUnitsDataUseCase getUnitsDataUseCase;
  final GetUnitByBrandUsecase getUnitByBrandUsecase;

  UnitListBloc(
    this.getUnitsDataUseCase,
    this.getUnitByBrandUsecase,
  ) : super(HomeInitial()) {
    on<OnGetUnitData>(onGetData);
    on<OnBrandFilterActive>(onBrandFilterActive);
    on<OnBrandFilterDiactivate>(onBrandFilterDiactivate);
  }

  List<String> brandsList = [];

  void onGetData(OnGetUnitData event, Emitter<UnitListState> emit) async {
    emit(UnitDataLoading());

    final List<UnitsEntity> data =
        await getUnitsDataUseCase.motorcycleRepository.getUnitsData();

    if (data.isNotEmpty) {
      emit(UnitDataLoaded(data));
    } else {
      emit(UnitDataEmpty());
    }
  }

  void onBrandFilterActive(
      OnBrandFilterActive event, Emitter<UnitListState> emit) async {
    emit(UnitDataLoading());

    brandsList.add(event.brandName!);

    final List<UnitsEntity> unitListByBrands = await getUnitByBrandUsecase
        .motorcycleRepository
        .getUnitByBrand(brandsList);

    if (unitListByBrands.isNotEmpty) {
      emit(UnitDataLoaded(unitListByBrands));
    } else {
      emit(UnitDataEmpty());
    }
  }

  void onBrandFilterDiactivate(
      OnBrandFilterDiactivate event, Emitter<UnitListState> emit) async {
    emit(UnitDataLoading());

    brandsList.remove(event.brandName!);

    final List<UnitsEntity> unitListByBrands = await getUnitByBrandUsecase
        .motorcycleRepository
        .getUnitByBrand(brandsList);

    if (unitListByBrands.isNotEmpty) {
      emit(UnitDataLoaded(unitListByBrands));
    } else {
      emit(UnitDataEmpty());
    }
  }
}
