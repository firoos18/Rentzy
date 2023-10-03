import 'package:rentzy_rpl/core/usecases/usecases.dart';
import 'package:rentzy_rpl/instant_booking/domain/repository/instant_booking_repository.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/units_entity.dart';

class GetAvailableUnitsUsecase extends UseCase<List<UnitsEntity>, String> {
  final InstantBookingRepository instantBookingRepository;

  GetAvailableUnitsUsecase(this.instantBookingRepository);

  @override
  Future<List<UnitsEntity>> call({String? params}) {
    return instantBookingRepository.getAvailableUnits(params!);
  }
}
