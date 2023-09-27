import 'package:equatable/equatable.dart';

class UnitsEntity extends Equatable {
  final String? name;
  final String? brands;
  final double? rating;
  final String? imageUrl;
  final int? pricePerDay;
  final String? yearManufactured;

  const UnitsEntity(
      {this.brands,
      this.imageUrl,
      this.name,
      this.pricePerDay,
      this.rating,
      this.yearManufactured});

  @override
  List<Object?> get props => [
        name,
        brands,
        imageUrl,
        pricePerDay,
        rating,
        yearManufactured,
      ];
}
