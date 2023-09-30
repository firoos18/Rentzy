import 'package:rentzy_rpl/user_reviews/domain/entities/user_reviews_entity.dart';

abstract class UserReviewsRepository {
  Future<List<UserReviewsEntity>> getUserReviews(
      String? unitId, String? userId);
}
