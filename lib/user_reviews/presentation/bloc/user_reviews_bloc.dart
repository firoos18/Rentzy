import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rentzy_rpl/user_reviews/domain/entities/user_reviews_entity.dart';
import 'package:rentzy_rpl/user_reviews/domain/usecases/get_user_reviews_usecases.dart';

part 'user_reviews_event.dart';
part 'user_reviews_state.dart';

class UserReviewsBloc extends Bloc<UserReviewsEvent, UserReviewsState> {
  final GetUserReviewsUsecase getUserReviewsUsecase;

  UserReviewsBloc(this.getUserReviewsUsecase) : super(UserReviewsInitial()) {
    on<OnGetUserReviews>(onGetUserReviews);
  }

  void onGetUserReviews(
      OnGetUserReviews event, Emitter<UserReviewsState> emit) async {
    emit(UserReviewsLoading());

    final List<UserReviewsEntity> data = await getUserReviewsUsecase
        .userReviewsRepository
        .getUserReviews(event.unitId, event.userId);

    if (data.isNotEmpty) {
      emit(UserReviewsLoaded(userReviewsList: data));
    } else {
      emit(UserReviewsEmpty());
    }
  }
}
