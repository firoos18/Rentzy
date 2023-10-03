import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:rentzy_rpl/core/utils/date_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'date_picker_event.dart';
part 'date_picker_state.dart';

class DatePickerBloc extends Bloc<DatePickerEvent, DatePickerState> {
  DatePickerBloc() : super(AvailableDateInitial()) {
    on<OnSelectedMonth>(onSelectedMonth);
  }

  void onSelectedMonth(OnSelectedMonth event, Emitter<DatePickerState> emit) {
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
