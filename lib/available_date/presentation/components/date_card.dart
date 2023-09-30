import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  final String dayName;
  final String dayDate;
  final bool? isDateNow;

  const DateCard({
    super.key,
    required this.dayDate,
    required this.dayName,
    this.isDateNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 90,
      width: 68,
      decoration: BoxDecoration(
        border: Border.all(
          color: isDateNow!
              ? const Color(0xff41436A)
              : const Color(0xff0E0F0E).withOpacity(0.5),
          width: isDateNow! ? 1 : 0.5,
        ),
        borderRadius: BorderRadius.circular(8),
        color: isDateNow! ? const Color(0xff41436A) : const Color(0xffFAFAFA),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayName,
            style: TextStyle(
              fontSize: 16,
              color: isDateNow! ? Colors.white : const Color(0xff0E0F0E),
            ),
          ),
          Text(
            dayDate,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDateNow! ? Colors.white : const Color(0xff0E0F0E),
            ),
          ),
        ],
      ),
    );
  }
}
