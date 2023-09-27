import 'package:rentzy_rpl/core/usecases/usecases.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/brand_filter_entity.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/repository/motorcycle_list_repository.dart';

class GetBrandsListUseCase extends UseCase<List<BrandFilterEntity>, void> {
  final MotorcycleRepository motorcycleRepository;

  GetBrandsListUseCase(this.motorcycleRepository);

  @override
  Future<List<BrandFilterEntity>> call({void params}) {
    return motorcycleRepository.getBrandFilterItem();
  }
}
