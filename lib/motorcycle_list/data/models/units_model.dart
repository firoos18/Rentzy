import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/units_entity.dart';

class UnitsModel extends UnitsEntity {
  const UnitsModel({
    final String? unitId,
    final String? name,
    final String? brands,
    final String? yearManufactured,
    final double? rating,
    final int? pricePerDay,
    final String? imageUrl,
    final String? topSpeed,
    final String? tankCapacity,
    final String? engineCapacity,
    final String? transmission,
  }) : super(
          unitId: unitId,
          brands: brands,
          pricePerDay: pricePerDay,
          name: name,
          rating: rating,
          imageUrl: imageUrl,
          yearManufactured: yearManufactured,
          engineCapacity: engineCapacity,
          tankCapacity: tankCapacity,
          topSpeed: topSpeed,
          transmission: transmission,
        );

  factory UnitsModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return UnitsModel(
        unitId: doc.id,
        name: doc.data()!['name'],
        brands: doc.data()!['brands'],
        yearManufactured: doc.data()!['yearManufactured'],
        rating: doc.data()!['rating'],
        pricePerDay: doc.data()!['pricePerDay'],
        imageUrl: doc.data()!['imageUrl'],
        engineCapacity: doc.data()!['engineCapacity'],
        topSpeed: doc.data()!['topSpeed'],
        tankCapacity: doc.data()!['tankCapacity'],
        transmission: doc.data()!['transmission']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'brands': brands,
      'yearManufactured': yearManufactured,
      'rating': rating,
      'pricePerDay': pricePerDay,
      'imageUrl': imageUrl,
    };
  }
}
