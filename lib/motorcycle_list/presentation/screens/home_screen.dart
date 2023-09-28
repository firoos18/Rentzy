import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rentzy_rpl/motorcycle_detail/presentation/screen/motorcycle_detail_screen.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/bloc/home_bloc.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/components/brands_filter_item.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/components/unit_item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(OnGetData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          'Rentzy',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(FeatherIcons.bell)),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(right: 16, left: 16, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color(0xff0E0F0E),
        ),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: GNav(
              gap: 4,
              tabBackgroundColor: Color(0xffF1F1F1),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              iconSize: 20,
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              color: Colors.white,
              tabs: [
                GButton(
                  icon: FeatherIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: FeatherIcons.calendar,
                  text: 'Book',
                ),
                GButton(
                  icon: FeatherIcons.user,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (state is DataLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 230,
                    child: Text(
                      'Find the best Bike to rent today!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: TextField(
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Find bikes!',
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: const Color(0xffF1F1F1),
                            filled: true,
                            prefixIcon: const Icon(
                              FeatherIcons.search,
                              color: Color(0xff0E0F0E),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 64,
                          decoration: BoxDecoration(
                            color: const Color(0xfff1f1f1),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          child: const Icon(
                            FeatherIcons.filter,
                            color: Color(0xff0E0F0E),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Brands',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0E0F0E),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 64,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.brandsList?.length,
                      itemBuilder: (ctx, idx) => BrandsFilterItem(
                        imageUrl: state.brandsList?[idx].imageUrl,
                        name: state.brandsList?[idx].name,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'All Bikes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0E0F0E),
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FeatherIcons.moreVertical),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Flexible(
                    fit: FlexFit.loose,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                        },
                        child: UnitItemCard(
                          imageUrl: state.unitList?[idx].imageUrl,
                          name: state.unitList?[idx].name,
                          pricePerDay: state.unitList?[idx].pricePerDay,
                          rating: state.unitList?[idx].rating,
                          brands: state.unitList?[idx].brands,
                          yearManufactured:
                              state.unitList?[idx].yearManufactured,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
