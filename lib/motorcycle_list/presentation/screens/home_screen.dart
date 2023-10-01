import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/blocs/unit_list/unit_list_bloc.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/components/brand_filter_section.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/components/unit_list_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      FeatherIcons.filter,
                      color: Color(0xff0E0F0E),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          const BrandFilterSection(),
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
          const UnitListSection(),
        ],
      ),
    );
  }
}
