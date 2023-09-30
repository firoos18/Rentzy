part of 'user_reviews_bloc.dart';

sealed class UserReviewsEvent extends Equatable {
  final String? unitId;
  final String? userId;

  const UserReviewsEvent({this.unitId, this.userId});

  @override
  List<Object?> get props => [unitId, userId];
}

final class OnGetUserReviews extends UserReviewsEvent {
  const OnGetUserReviews(final String? unitId, final String? userId)
      : super(unitId: unitId, userId: userId);
}
