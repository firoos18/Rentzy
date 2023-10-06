import 'package:rentzy_rpl/checkout/data/models/checkout_model.dart';
import 'package:rentzy_rpl/checkout/domain/repository/checkout_repository.dart';
import 'package:rentzy_rpl/core/resources/datastate.dart';
import 'package:rentzy_rpl/core/usecases/usecases.dart';

class PostCheckoutDataUsecase
    extends UseCase<DataState<String>, CheckoutModel> {
  final CheckoutRepository checkoutRepository;

  PostCheckoutDataUsecase(this.checkoutRepository);

  @override
  Future<DataState<String>> call({CheckoutModel? params}) {
    return checkoutRepository.postCheckoutData(params!);
  }
}
