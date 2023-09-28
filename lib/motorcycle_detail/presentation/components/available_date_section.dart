import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentzy_rpl/core/utils/date_utils.dart';
import 'package:rentzy_rpl/motorcycle_detail/presentation/bloc/motorcycle_detail_bloc.dart';
import 'package:rentzy_rpl/motorcycle_detail/presentation/components/date_card.dart';
import 'package:intl/intl.dart';

class AvailableDateSection extends StatefulWidget {
  const AvailableDateSection({super.key});

  @override
  State<AvailableDateSection> createState() => _AvailableDateSectionState();
}

class _AvailableDateSectionState extends State<AvailableDateSection> {
  String selectedMonth = DateFormat('MMMM').format(DateTime.now());

  @override
  void initState() {
    context
        .read<MotorcycleDetailBloc>()
        .add(OnSelectedMonth(DateTime.now().month - 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MotorcycleDetailBloc, MotorcycleDetailState>(
      builder: (context, state) {
        if (state is DataLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (state is DateChanged) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: SizedBox(
                  height: 90,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.daysOfMonths?.length,
                    itemBuilder: (ctx, idx) {
                      final today =
                          DateTime(now.year, now.month, state.listOfDates![idx])
                              .day;

                      if (today == now.day &&
                          state.monthIndex! + 1 == now.month) {
                        return DateCard(
                          dayDate: state.listOfDates![idx].toString(),
                          dayName: state.daysOfMonths![idx].substring(0, 3),
                          isDateNow: true,
                        );
                      }

                      return DateCard(
                        dayDate: state.listOfDates![idx].toString(),
                        dayName: state.daysOfMonths![idx].substring(0, 3),
                        isDateNow: false,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DropdownMenu(
                    initialSelection: selectedMonth,
                    width: 150,
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: const Color(0xff0E0F0E).withOpacity(0.5),
                            width: 0.5),
                      ),
                    ),
                    onSelected: (value) {
                      setState(() {
                        selectedMonth = value!;
                      });
                      final monthIndex = monthList.indexOf(value!);

                      context
                          .read<MotorcycleDetailBloc>()
                          .add(OnSelectedMonth(monthIndex));
                      // print(state.listOfDates);
                    },
                    dropdownMenuEntries: monthList
                        .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ],
              )
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
