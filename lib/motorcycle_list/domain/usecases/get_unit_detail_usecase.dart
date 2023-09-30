import 'package:rentzy_rpl/core/usecases/usecases.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/units_entity.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/repository/motorcycle_list_repository.dart';

class GetUnitDetailUsecase extends UseCase<UnitsEntity, String> {
  final MotorcycleRepository motorcycleRepository;

  GetUnitDetailUsecase(this.motorcycleRepository);

  @override
  Future<UnitsEntity> call({String? params}) async {
    return motorcycleRepository.getUnitSpecificData(params!);
  }
}
