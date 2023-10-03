import 'package:rentzy_rpl/motorcycle_list/domain/entities/units_entity.dart';

abstract class InstantBookingRepository {
  Future<List<UnitsEntity>> getAvailableUnits(String date);
}
