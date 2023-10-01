import 'package:rentzy_rpl/motorcycle_list/data/datasource/brands_service.dart';
import 'package:rentzy_rpl/motorcycle_list/data/datasource/units_service.dart';
import 'package:rentzy_rpl/motorcycle_list/data/models/brand_filter_model.dart';
import 'package:rentzy_rpl/motorcycle_list/data/models/units_model.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/units_entity.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/repository/motorcycle_list_repository.dart';

class MotorCycleRepositoryImpl implements MotorcycleRepository {
  final BrandsService brandsService;
  final UnitsService unitsService;

  MotorCycleRepositoryImpl(this.brandsService, this.unitsService);

  @override
  Future<List<BrandFilterModel>> getBrandFilterItem() {
    return brandsService.getBrandsData();
  }

  @override
  Future<UnitsModel> getUnitSpecificData(String unitId) {
    return unitsService.getUnitSpecificData(unitId);
  }

  @override
  Future<List<UnitsModel>> getUnitsData() {
    return unitsService.getUnitsData();
  }

  @override
  Future<List<UnitsEntity>> getUnitByBrand(List<String?> brandName) {
    return unitsService.getUnitByBrand(brandName);
  }
}
