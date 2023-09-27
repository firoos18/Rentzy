import 'package:flutter/material.dart';

class BrandsFilterItem extends StatefulWidget {
  final String? name;
  final String? imageUrl;

  const BrandsFilterItem({
    super.key,
    this.imageUrl,
    this.name,
  });

  @override
  State<BrandsFilterItem> createState() => _BrandsFilterItemState();
}

class _BrandsFilterItemState extends State<BrandsFilterItem> {
  bool isSelected = false;

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
