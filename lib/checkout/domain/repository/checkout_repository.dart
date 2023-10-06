import 'package:rentzy_rpl/checkout/data/models/checkout_model.dart';
import 'package:rentzy_rpl/core/resources/datastate.dart';

abstract class CheckoutRepository {
  Future<DataState<String>> postCheckoutData(CheckoutModel checkoutModel);
}
