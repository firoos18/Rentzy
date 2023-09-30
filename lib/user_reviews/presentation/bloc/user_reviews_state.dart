part of 'user_reviews_bloc.dart';

sealed class UserReviewsState extends Equatable {
  final List<UserReviewsEntity>? userReviewsList;

  const UserReviewsState({this.userReviewsList});

  @override
  List<Object?> get props => [userReviewsList];
}

final class UserReviewsInitial extends UserReviewsState {}

final class UserReviewsLoading extends UserReviewsState {}

final class UserReviewsLoaded extends UserReviewsState {
  const UserReviewsLoaded({final List<UserReviewsEntity>? userReviewsList})
      : super(userReviewsList: userReviewsList);
}

final class UserReviewsEmpty extends UserReviewsState {}
