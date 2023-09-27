import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentzy_rpl/motorcycle_list/data/models/units_model.dart';

class UnitsService {
  final FirebaseFirestore firebaseFirestore;

  UnitsService(this.firebaseFirestore);

  Future<List<UnitsModel>> getUnitsData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firebaseFirestore.collection('units').get();

    for (var element in snapshot.docs) {
      print(element.data());
    }

    return snapshot.docs
        .map((docSnapshot) => UnitsModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
