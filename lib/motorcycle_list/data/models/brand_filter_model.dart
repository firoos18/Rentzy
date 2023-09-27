import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/brand_filter_entity.dart';

class BrandFilterModel extends BrandFilterEntity {
  const BrandFilterModel({
    final String? name,
    final String? imageUrl,
  }) : super(
          imageUrl: imageUrl,
          name: name,
        );

  factory BrandFilterModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return BrandFilterModel(
      name: doc.data()!['name'],
      imageUrl: doc.data()!['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}
