import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentzy_rpl/user_reviews/data/models/user_reviews_model.dart';

class UserReviewsServices {
  final FirebaseFirestore firebaseFirestore;

  UserReviewsServices(this.firebaseFirestore);

  Future<List<UserReviewsModel>> getUserReviews(
      String? unitId, String? userId) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firebaseFirestore
        .collection('units')
        .doc(unitId)
        .collection('user-reviews')
        .get();

    DocumentSnapshot<Map<String, dynamic>> userData =
        await firebaseFirestore.doc('users/$userId').get();

    return snapshot.docs.map((docSnapshot) {
      return UserReviewsModel.fromDocumentSnapshot(docSnapshot, userData);
    }).toList();
  }
}
