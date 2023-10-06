part of 'checkout_bloc.dart';

sealed class CheckoutEvent extends Equatable {
  final CheckoutModel? checkoutModel;

  const CheckoutEvent({this.checkoutModel});

  @override
  List<Object?> get props => [checkoutModel];
}

final class OnCheckoutButtonPressed extends CheckoutEvent {
  const OnCheckoutButtonPressed({final CheckoutModel? checkoutModel})
      : super(checkoutModel: checkoutModel);
}
