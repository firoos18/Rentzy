import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentzy_rpl/user_reviews/domain/entities/user_reviews_entity.dart';

class UserReviewsModel extends UserReviewsEntity {
  const UserReviewsModel({
    final String? reviews,
    final double? rating,
    final DocumentReference? userId,
    final String? imageUrl,
    final String? username,
  }) : super(
          rating: rating,
          reviews: reviews,
          userId: userId,
          username: username,
          imageUrl: imageUrl,
        );

  factory UserReviewsModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> reviewData,
      DocumentSnapshot<Map<String, dynamic>> userData) {
    return UserReviewsModel(
      reviews: reviewData.data()!['reviews'],
      rating: reviewData.data()!['rating'],
      userId: reviewData.data()!['userId'],
      username: userData.data()!['username'],
      imageUrl: userData.data()!['imageUrl'],
    );
  }
}
