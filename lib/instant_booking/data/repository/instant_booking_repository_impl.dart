import 'package:rentzy_rpl/instant_booking/data/datasource/available_units_service.dart';
import 'package:rentzy_rpl/instant_booking/domain/repository/instant_booking_repository.dart';
import 'package:rentzy_rpl/motorcycle_list/data/models/units_model.dart';

class InstantBookingRepositoryImpl implements InstantBookingRepository {
  final AvailableUnitsService availableUnitsService;

  InstantBookingRepositoryImpl(this.availableUnitsService);

  @override
  Future<List<UnitsModel>> getAvailableUnits(String date) {
    return availableUnitsService.getBookingsData(date);
  }
}
