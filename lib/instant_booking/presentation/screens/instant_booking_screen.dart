import 'package:flutter/widgets.dart';
import 'package:rentzy_rpl/instant_booking/presentation/components/available_date_section.dart';
import 'package:rentzy_rpl/instant_booking/presentation/components/unit_list_section.dart';

class InstantBookingScreen extends StatelessWidget {
  const InstantBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Date',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'Tap on this date below to see available units.',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 16),
          AvailableDateSection(),
          SizedBox(height: 24),
          Text(
            'Available Unit(s)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          UnitListSection(),
        ],
      ),
    );
  }
}
