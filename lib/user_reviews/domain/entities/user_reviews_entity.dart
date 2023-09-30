import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserReviewsEntity extends Equatable {
  final String? reviews;
  final double? rating;
  final DocumentReference? userId;
  final String? username;
  final String? imageUrl;

  const UserReviewsEntity({
    this.rating,
    this.reviews,
    this.userId,
    this.imageUrl,
    this.username,
  });

  @override
  List<Object?> get props => [
        reviews,
        rating,
        userId,
        imageUrl,
        username,
      ];
}
