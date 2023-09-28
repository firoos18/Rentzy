import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:rentzy_rpl/core/utils/date_utils.dart';

part 'motorcycle_detail_event.dart';
part 'motorcycle_detail_state.dart';

class MotorcycleDetailBloc
    extends Bloc<MotorcycleDetailEvent, MotorcycleDetailState> {
  MotorcycleDetailBloc() : super(MotorcycleDetailInitial()) {
    on<OnSelectedMonth>(onSelectedMonth);
  }

  void onSelectedMonth(
      OnSelectedMonth event, Emitter<MotorcycleDetailState> emit) {
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
