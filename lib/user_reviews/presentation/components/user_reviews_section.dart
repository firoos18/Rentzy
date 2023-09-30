import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentzy_rpl/user_reviews/presentation/bloc/user_reviews_bloc.dart';
import 'package:rentzy_rpl/user_reviews/presentation/components/user_reviews_card.dart';

class UserReviewsSection extends StatelessWidget {
  const UserReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserReviewsBloc, UserReviewsState>(
      builder: (context, state) {
        if (state is UserReviewsLoading) {
          return const SizedBox(
            height: 150,
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        if (state is UserReviewsLoaded) {
          return Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.userReviewsList?.length,
              itemBuilder: (ctx, idx) {
                return UserReviewsCard(
                  userReviewsEntity: state.userReviewsList![idx],
                );
              },
            ),
          );
        }
        if (state is UserReviewsEmpty) {
          return const SizedBox();
        }

        return const SizedBox();
      },
    );
  }
}
