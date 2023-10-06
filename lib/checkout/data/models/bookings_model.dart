import 'package:rentzy_rpl/checkout/domain/entities/bookings_entity.dart';

class BookingModel extends BookingsEntity {
  const BookingModel({
    final String? unitId,
    final String? userId,
    final String? startDate,
    final String? endDate,
  }) : super(
          startDate: startDate,
          endDate: endDate,
          unitId: unitId,
          userId: userId,
        );

  Map<String, dynamic> toMap() {
    return {
      'unitId': unitId,
      'userId': userId,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
