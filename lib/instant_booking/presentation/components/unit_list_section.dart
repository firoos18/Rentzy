import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentzy_rpl/instant_booking/presentation/bloc/available_units/available_units_bloc.dart';
import 'package:rentzy_rpl/instant_booking/presentation/components/unit_item_card.dart';
import 'package:rentzy_rpl/motorcycle_detail/presentation/screen/motorcycle_detail_screen.dart';
import 'package:rentzy_rpl/user_reviews/presentation/bloc/user_reviews_bloc.dart';

class UnitListSection extends StatefulWidget {
  const UnitListSection({super.key});

  @override
  State<UnitListSection> createState() => _UnitListSectionState();
}

class _UnitListSectionState extends State<UnitListSection> {
  @override
  void initState() {
    context.read<AvailableUnitsBloc>().add(OnScreenChanged());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableUnitsBloc, AvailableUnitsState>(
      builder: (context, state) {
        if (state is AvailableUnitsLoading) {
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
        if (state is AvailableUnitsLoaded) {
          return Flexible(
            fit: FlexFit.loose,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 310,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: state.unitsList?.length,
              itemBuilder: (ctx, idx) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MotorcycleDetailScreen(
                          unitsEntity: state.unitsList![idx]),
                    ),
                  );
                  context.read<UserReviewsBloc>().add(
                        OnGetUserReviews(
                          state.unitsList![idx].unitId,
                          FirebaseAuth.instance.currentUser?.uid,
                        ),
                      );
                },
                child: UnitItemCard(
                  imageUrl: state.unitsList?[idx].imageUrl,
                  name: state.unitsList?[idx].name,
                  pricePerDay: state.unitsList?[idx].pricePerDay,
                  rating: state.unitsList?[idx].rating,
                  brands: state.unitsList?[idx].brands,
                  yearManufactured: state.unitsList?[idx].yearManufactured,
                ),
              ),
            ),
          );
        }
        if (state is AvailableUnitsEmpty) {
          return const Center(
            child: Text('No available units at the moment'),
          );
        }

        return const SizedBox();
      },
    );
  }
}
