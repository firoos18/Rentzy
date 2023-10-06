import 'package:rentzy_rpl/checkout/data/datasources/checkout_services.dart';
import 'package:rentzy_rpl/checkout/data/models/checkout_model.dart';
import 'package:rentzy_rpl/checkout/domain/repository/checkout_repository.dart';
import 'package:rentzy_rpl/core/resources/datastate.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutServices checkoutServices;

  CheckoutRepositoryImpl(this.checkoutServices);

  @override
  Future<DataState<String>> postCheckoutData(CheckoutModel checkoutModel) {
    return checkoutServices.postCheckoutData(checkoutModel);
  }
}
