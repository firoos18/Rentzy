import 'package:rentzy_rpl/checkout/domain/entities/checkout_entity.dart';

class CheckoutModel extends CheckoutEntity {
  const CheckoutModel({
    final String? unitId,
    final int? daysCount,
    final int? totalPrice,
    final String? startDate,
    final String? endDate,
  }) : super(
          unitId: unitId,
          daysCount: daysCount,
          totalPrice: totalPrice,
          startDate: startDate,
          endDate: endDate,
        );

  Map<String, dynamic> toMap() {
    return {
      'unitId': unitId,
      'totalPrice': totalPrice,
      'daysCount': daysCount,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
