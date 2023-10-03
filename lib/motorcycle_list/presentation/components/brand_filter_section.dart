import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/blocs/brand_filter/brand_filter_bloc.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/components/brands_filter_item.dart';

class BrandFilterSection extends StatefulWidget {
  const BrandFilterSection({super.key});

  @override
  State<BrandFilterSection> createState() => _BrandFilterSectionState();
}

class _BrandFilterSectionState extends State<BrandFilterSection> {
  @override
  void initState() {
    context.read<BrandFilterBloc>().add(OnGetData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandFilterBloc, BrandFilterState>(
      builder: (context, state) {
        if (state is DataLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is DataLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  itemCount: state.brandFilterData?.length,
                  itemBuilder: (ctx, idx) => BrandsFilterItem(
                    imageUrl: state.brandFilterData?[idx].imageUrl,
                    name: state.brandFilterData?[idx].name,
                    isSelected: false,
                  ),
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
