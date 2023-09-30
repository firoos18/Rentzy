import 'package:rentzy_rpl/motorcycle_list/domain/entities/brand_filter_entity.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/units_entity.dart';

abstract class MotorcycleRepository {
  Future<List<BrandFilterEntity>> getBrandFilterItem();

  Future<List<UnitsEntity>> getUnitsData();

  Future<UnitsEntity> getUnitSpecificData(String unitId);
}
