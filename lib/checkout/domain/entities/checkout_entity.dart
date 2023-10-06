import 'package:equatable/equatable.dart';

class CheckoutEntity extends Equatable {
  final String? unitId;
  final int? totalPrice;
  final int? daysCount;
  final String? startDate;
  final String? endDate;

  const CheckoutEntity(
      {this.daysCount,
      this.endDate,
      this.startDate,
      this.totalPrice,
      this.unitId});

  @override
  List<Object?> get props => [
        totalPrice,
        unitId,
        daysCount,
        startDate,
        endDate,
      ];
}
