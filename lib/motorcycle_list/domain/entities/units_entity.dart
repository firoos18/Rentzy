import 'package:equatable/equatable.dart';

class UnitsEntity extends Equatable {
  final String? unitId;
  final String? name;
  final String? brands;
  final double? rating;
  final String? imageUrl;
  final int? pricePerDay;
  final String? yearManufactured;
  final String? engineCapacity;
  final String? topSpeed;
  final String? tankCapacity;
  final String? transmission;

  const UnitsEntity({
    this.unitId,
    this.brands,
    this.imageUrl,
    this.name,
    this.pricePerDay,
    this.rating,
    this.yearManufactured,
    this.engineCapacity,
    this.tankCapacity,
    this.topSpeed,
    this.transmission,
  });

  @override
  List<Object?> get props => [
        unitId,
        name,
        brands,
        imageUrl,
        pricePerDay,
        rating,
        yearManufactured,
        engineCapacity,
        tankCapacity,
        topSpeed,
        transmission,
      ];
}
