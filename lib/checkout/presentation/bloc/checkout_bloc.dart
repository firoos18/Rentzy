import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rentzy_rpl/checkout/data/models/checkout_model.dart';
import 'package:rentzy_rpl/checkout/domain/repository/checkout_repository.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutRepository checkoutRepository;

  CheckoutBloc(this.checkoutRepository) : super(CheckoutInitial()) {
    on<OnCheckoutButtonPressed>(onCheckoutButtonPressed);
  }

  void onCheckoutButtonPressed(
      OnCheckoutButtonPressed event, Emitter<CheckoutState> emit) async {
    final data =
        await checkoutRepository.postCheckoutData(event.checkoutModel!);

    if (data.data != null && data.data!.isNotEmpty) {
      print(data.data);
    } else {
      print(data.exception);
    }
  }
}
