import 'package:rentzy_rpl/core/usecases/usecases.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/units_entity.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/repository/motorcycle_list_repository.dart';

class GetUnitsDataUseCase extends UseCase<List<UnitsEntity>, void> {
  final MotorcycleRepository motorcycleRepository;

  GetUnitsDataUseCase(this.motorcycleRepository);

  @override
  Future<List<UnitsEntity>> call({void params}) {
    return motorcycleRepository.getUnitsData();
  }
}
