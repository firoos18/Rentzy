import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentzy_rpl/motorcycle_detail/presentation/screen/motorcycle_detail_screen.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/blocs/unit_list/unit_list_bloc.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/components/unit_item_card.dart';
import 'package:rentzy_rpl/user_reviews/presentation/bloc/user_reviews_bloc.dart';

class UnitListSection extends StatefulWidget {
  const UnitListSection({super.key});

  @override
  State<UnitListSection> createState() => _UnitListSectionState();
}

class _UnitListSectionState extends State<UnitListSection> {
  @override
  void initState() {
    context.read<UnitListBloc>().add(OnGetUnitData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnitListBloc, UnitListState>(
      builder: (context, state) {
        if (state is UnitDataLoading) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CupertinoActivityIndicator(),
              ),
            ],
          );
        }
        if (state is UnitDataLoaded) {
          return Flexible(
            fit: FlexFit.loose,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 300,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: state.unitList?.length,
              itemBuilder: (ctx, idx) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MotorcycleDetailScreen(
                            unitsEntity: state.unitList![idx])),
                  );
                  context.read<UserReviewsBloc>().add(OnGetUserReviews(
                        state.unitList![idx].unitId,
                        FirebaseAuth.instance.currentUser?.uid,
                      ));
                },
                child: UnitItemCard(
                  imageUrl: state.unitList?[idx].imageUrl,
                  name: state.unitList?[idx].name,
                  pricePerDay: state.unitList?[idx].pricePerDay,
                  rating: state.unitList?[idx].rating,
                  brands: state.unitList?[idx].brands,
                  yearManufactured: state.unitList?[idx].yearManufactured,
                ),
              ),
            ),
          );
        }
        if (state is UnitDataEmpty) {
          return const Center(
            child: Text('No available units at the moment'),
          );
        }

        return const SizedBox();
      },
    );
  }
}
