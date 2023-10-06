import 'package:equatable/equatable.dart';

class BookingsEntity extends Equatable {
  final String? unitId;
  final String? userId;
  final String? startDate;
  final String? endDate;

  const BookingsEntity({
    this.endDate,
    this.startDate,
    this.unitId,
    this.userId,
  });

  @override
  List<Object?> get props => [unitId, userId, startDate, endDate];
}
