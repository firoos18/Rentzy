import 'package:rentzy_rpl/core/usecases/usecases.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/units_entity.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/repository/motorcycle_list_repository.dart';

class GetUnitByBrandUsecase extends UseCase<List<UnitsEntity>, List<String>?> {
  final MotorcycleRepository motorcycleRepository;

  GetUnitByBrandUsecase(this.motorcycleRepository);

  @override
  Future<List<UnitsEntity>> call({List<String?>? params}) {
    return motorcycleRepository.getUnitByBrand(params!);
  }
}
