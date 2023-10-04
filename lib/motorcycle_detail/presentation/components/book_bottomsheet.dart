import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:rentzy_rpl/core/utils/date_utils.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/units_entity.dart';

class BookBottomsheet extends StatefulWidget {
  final UnitsEntity unitsEntity;

  const BookBottomsheet({super.key, required this.unitsEntity});

  @override
  State<BookBottomsheet> createState() => _BookBottomsheetState();
}

class _BookBottomsheetState extends State<BookBottomsheet> {
  int daysCount = 0;
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  final TextEditingController startDateTextEditingController =
      TextEditingController();
  final TextEditingController endDateTextEditingController =
      TextEditingController();

  late int totalPrice = widget.unitsEntity.pricePerDay! * daysCount;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    onSelectStartDate(BuildContext context, bool isStartDate) async {
      DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: DateTime(now.year + 1),
      );

      if (isStartDate) {
        if (newSelectedDate != null) {
          setState(() {
            selectedStartDate = newSelectedDate;
          });
          startDateTextEditingController.text =
              DateFormat('d MMM yyyy').format(selectedStartDate!);
        }
      } else {
        if (newSelectedDate != null) {
          setState(() {
            selectedEndDate = newSelectedDate;
          });
          endDateTextEditingController.text =
              DateFormat('d MMM yyyy').format(selectedEndDate!);
        }
      }

      if (selectedStartDate != null && selectedEndDate != null) {
        setState(() {
          daysCount =
              selectedStartDate!.difference(selectedEndDate!).inDays.abs();
        });
      }
    }

    return BottomSheet(
      onClosing: () {},
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Book',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.unitsEntity.name!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${widget.unitsEntity.brands!} - ${widget.unitsEntity.yearManufactured}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Per Day',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'Rp${widget.unitsEntity.pricePerDay}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Start date',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: screenWidth / 2.5,
                      child: TextField(
                        canRequestFocus: false,
                        controller: startDateTextEditingController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: const Color(0xff0E0F0E).withOpacity(0.5),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xff0E0F0E),
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              onSelectStartDate(context, true);
                            },
                            icon: const Icon(FeatherIcons.calendar),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'End date',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: screenWidth / 2.5,
                      child: TextField(
                        canRequestFocus: false,
                        controller: endDateTextEditingController,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: const Color(0xff0E0F0E).withOpacity(0.5),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xff0E0F0E),
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              onSelectStartDate(context, false);
                            },
                            icon: const Icon(FeatherIcons.calendar),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Summary',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$daysCount day(s)',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Rp${widget.unitsEntity.pricePerDay! * daysCount}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                backgroundColor: const Color(0xff0E0F0E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Checkout - Rp${widget.unitsEntity.pricePerDay! * daysCount}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFAFAFA),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
