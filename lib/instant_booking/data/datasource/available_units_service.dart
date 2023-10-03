import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentzy_rpl/motorcycle_list/data/models/units_model.dart';

class AvailableUnitsService {
  final FirebaseFirestore firebaseFirestore;

  AvailableUnitsService(this.firebaseFirestore);

  Future<List<UnitsModel>> getBookingsData(String date) async {
    final List<String> unitIdList = [];

    QuerySnapshot<Map<String, dynamic>> data = await firebaseFirestore
        .collection('bookings')
        .where('date', isEqualTo: date)
        .get();

    for (var data in data.docs) {
      unitIdList.add(data.data()['unitId']);
    }

    if (unitIdList.isNotEmpty) {
      QuerySnapshot<Map<String, dynamic>> unitData = await firebaseFirestore
          .collection('units')
          .where(FieldPath.documentId, whereNotIn: unitIdList)
          .get();

      return unitData.docs
          .map((docSnapshot) => UnitsModel.fromDocumentSnapshot(docSnapshot))
          .toList();
    } else {
      QuerySnapshot<Map<String, dynamic>> unitData =
          await firebaseFirestore.collection('units').get();

      return unitData.docs
          .map((docSnapshot) => UnitsModel.fromDocumentSnapshot(docSnapshot))
          .toList();
    }
  }
}
