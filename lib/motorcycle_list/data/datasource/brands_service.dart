import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentzy_rpl/motorcycle_list/data/models/brand_filter_model.dart';

class BrandsService {
  final FirebaseFirestore firebaseFirestore;

  BrandsService(this.firebaseFirestore);

  Future<List<BrandFilterModel>> getBrandsData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firebaseFirestore.collection('brands').get();
    return snapshot.docs
        .map(
            (docSnapshot) => BrandFilterModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
