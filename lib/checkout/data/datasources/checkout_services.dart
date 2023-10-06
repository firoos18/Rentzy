import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentzy_rpl/checkout/data/models/bookings_model.dart';
import 'package:rentzy_rpl/checkout/data/models/checkout_model.dart';
import 'package:rentzy_rpl/core/resources/datastate.dart';

class CheckoutServices {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  const CheckoutServices(this.firebaseFirestore, this.firebaseAuth);

  Future<DataState<String>> postCheckoutData(
    CheckoutModel checkoutModel,
  ) async {
    final checkoutData = checkoutModel.toMap();
    final BookingModel bookingData = BookingModel(
      unitId: checkoutModel.unitId,
      userId: firebaseAuth.currentUser?.uid,
      startDate: checkoutModel.startDate,
      endDate: checkoutModel.endDate,
    );

    try {
      final data =
          await firebaseFirestore.collection('checkouts').add(checkoutData);
      await firebaseFirestore.collection('bookings').add(bookingData.toMap());

      return DataSuccess(data.id);
    } on FirebaseException catch (e) {
      return DataFailed(e);
    }
  }
}
