import 'package:flutter/cupertino.dart';

class UnitSpecificationsCard extends StatelessWidget {
  final String category;
  final String specifications;

  const UnitSpecificationsCard({
    super.key,
    required this.category,
    required this.specifications,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff0E0F0E).withOpacity(0.5),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffFAFAFA),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            category,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w300,
              color: const Color(0xff0E0F0E).withOpacity(0.7),
            ),
          ),
          Text(
            specifications,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff0E0F0E),
            ),
          ),
        ],
      ),
    );
  }
}
