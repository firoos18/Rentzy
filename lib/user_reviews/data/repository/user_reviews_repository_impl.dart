import 'package:rentzy_rpl/user_reviews/data/datasources/user_reviews_services.dart';
import 'package:rentzy_rpl/user_reviews/data/models/user_reviews_model.dart';
import 'package:rentzy_rpl/user_reviews/domain/repository/user_reviews_repository.dart';

class UserReviewsRepositoryImpl implements UserReviewsRepository {
  final UserReviewsServices userReviewsServices;

  UserReviewsRepositoryImpl(this.userReviewsServices);

  @override
  Future<List<UserReviewsModel>> getUserReviews(
      String? unitId, String? userId) {
    return userReviewsServices.getUserReviews(unitId, userId);
  }
}
