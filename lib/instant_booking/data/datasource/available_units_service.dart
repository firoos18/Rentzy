import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:rentzy_rpl/motorcycle_list/data/models/units_model.dart';

class AvailableUnitsService {
  final FirebaseFirestore firebaseFirestore;

  AvailableUnitsService(this.firebaseFirestore);

  Future<List<UnitsModel>> getBookingsData(String date) async {
    final List<String> unitIdList = [];

    QuerySnapshot<Map<String, dynamic>> startDateData = await firebaseFirestore
        .collection('bookings')
        .where('startDate', isEqualTo: date)
        .get();

    QuerySnapshot<Map<String, dynamic>> endDateData = await firebaseFirestore
        .collection('bookings')
        .where('endDate', isEqualTo: date)
        .get();

    QuerySnapshot<Map<String, dynamic>> unavailableUnits =
        await firebaseFirestore.collection('bookings').get();

    for (var data in unavailableUnits.docs) {
      print(data.data());
    }

    for (var data in startDateData.docs) {
      unitIdList.add(data.data()['unitId']);
    }

    for (var data in endDateData.docs) {
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
