import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:rentzy_rpl/core/utils/date_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'available_date_event.dart';
part 'available_date_state.dart';

class AvailableDateBloc extends Bloc<AvailableDateEvent, AvailableDateState> {
  AvailableDateBloc() : super(AvailableDateInitial()) {
    on<OnSelectedMonth>(onSelectedMonth);
  }

  void onSelectedMonth(
      OnSelectedMonth event, Emitter<AvailableDateState> emit) {
    emit(DataLoading());

    int totalDays = daysInMonth(
      DateTime(DateTime.now().year, event.monthIndex! + 1),
    );

    List<int> listOfDates = List.generate(totalDays, (index) => index + 1);
    List<String> daysOfMonths = List.generate(totalDays, (index) {
      return DateFormat('EEEE')
          .format(DateTime(now.year, event.monthIndex! + 1, index + 1));
    });

    emit(DateChanged(listOfDates, daysOfMonths, event.monthIndex!));
  }
}
