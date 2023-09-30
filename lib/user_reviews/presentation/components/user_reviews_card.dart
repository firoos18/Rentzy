import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:rentzy_rpl/user_reviews/domain/entities/user_reviews_entity.dart';

class UserReviewsCard extends StatelessWidget {
  final UserReviewsEntity userReviewsEntity;

  const UserReviewsCard({
    super.key,
    required this.userReviewsEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xffFAFAFA),
        border: Border.all(
          color: const Color(0xff0E0F0E).withOpacity(0.5),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (userReviewsEntity.imageUrl != null)
                  CircleAvatar(
                    backgroundImage: NetworkImage(userReviewsEntity.imageUrl!),
                    radius: 24,
                  ),
                if (userReviewsEntity.imageUrl == null)
                  CircleAvatar(
                    backgroundColor: const Color(0xff0E0F0E).withOpacity(0.5),
                    radius: 24,
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userReviewsEntity.username!,
                      style: TextStyle(
                        fontSize: 10,
                        color: const Color(0xff0E0F0E).withOpacity(0.7),
                      ),
                    ),
                    Text(
                      userReviewsEntity.reviews!,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0E0F0E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  FeatherIcons.star,
                  size: 14,
                  weight: 0.7,
                ),
                Text(
                  userReviewsEntity.rating.toString(),
                  style:
                      const TextStyle(fontSize: 14, color: Color(0xff0E0F0E)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
