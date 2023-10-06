part of 'checkout_bloc.dart';

sealed class CheckoutState extends Equatable {
  final String? documentId;
  final FirebaseException? firebaseException;

  const CheckoutState({this.documentId, this.firebaseException});

  @override
  List<Object?> get props => [documentId, firebaseException];
}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutDone extends CheckoutState {
  const CheckoutDone({final String? documentId})
      : super(documentId: documentId);
}

final class CheckoutFailed extends CheckoutState {
  const CheckoutFailed({final FirebaseException? firebaseException})
      : super(firebaseException: firebaseException);
}
