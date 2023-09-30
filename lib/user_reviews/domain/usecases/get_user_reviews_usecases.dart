import 'package:rentzy_rpl/core/usecases/usecases.dart';
import 'package:rentzy_rpl/user_reviews/domain/entities/user_reviews_entity.dart';
import 'package:rentzy_rpl/user_reviews/domain/repository/user_reviews_repository.dart';

class GetUserReviewsUsecase extends UseCase<List<UserReviewsEntity>, String> {
  final UserReviewsRepository userReviewsRepository;

  GetUserReviewsUsecase(this.userReviewsRepository);

  @override
  Future<List<UserReviewsEntity>> call(
      {String? params, String? userId, String? unitId}) {
    return userReviewsRepository.getUserReviews(unitId, userId);
  }
}
