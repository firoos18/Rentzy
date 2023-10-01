import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/blocs/unit_list/unit_list_bloc.dart';

class BrandsFilterItem extends StatefulWidget {
  final String? name;
  final String? imageUrl;
  final bool isSelected;

  const BrandsFilterItem({
    super.key,
    this.imageUrl,
    this.name,
    required this.isSelected,
  });

  @override
  State<BrandsFilterItem> createState() => _BrandsFilterItemState();
}

class _BrandsFilterItemState extends State<BrandsFilterItem> {
  late bool isSelected = widget.isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      splashColor: const Color(0xff0E0F0E).withOpacity(0.2),
      radius: 0.2,
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        if (isSelected) {
          context
              .read<UnitListBloc>()
              .add(OnBrandFilterActive(brandName: widget.name));
        } else {
          context
              .read<UnitListBloc>()
              .add(OnBrandFilterDiactivate(brandName: widget.name));
        }
      },
      child: Container(
        width: 64,
        height: 64,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? const Color(0xff0E0F0E).withOpacity(0.3)
                : const Color(0xff0E0F0E).withOpacity(0.5),
            width: 0.5,
          ),
          color: isSelected
              ? const Color(0xff0E0F0E).withOpacity(0.3)
              : const Color(0xffFAFAFA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.network(
          widget.imageUrl as String,
        ),
      ),
    );
  }
}
