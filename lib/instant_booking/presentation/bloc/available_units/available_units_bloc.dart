import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rentzy_rpl/core/utils/date_utils.dart';
import 'package:rentzy_rpl/instant_booking/domain/usecases/get_available_units_usecase.dart';
import 'package:rentzy_rpl/motorcycle_list/domain/entities/units_entity.dart';

part 'available_units_event.dart';
part 'available_units_state.dart';

class AvailableUnitsBloc
    extends Bloc<AvailableUnitsEvent, AvailableUnitsState> {
  final GetAvailableUnitsUsecase getAvailableUnitsUsecase;

  AvailableUnitsBloc(this.getAvailableUnitsUsecase)
      : super(AvailableUnitsInitial()) {
    on<OnDatePickerClicked>(onDatePickerClicked);
    on<OnScreenChanged>(onScreenChanged);
  }

  void onDatePickerClicked(
      OnDatePickerClicked event, Emitter<AvailableUnitsState> emit) async {
    emit(AvailableUnitsLoading());
    final String date =
        DateTime(now.year, event.monthIndex! + 1, event.dayDate!)
            .toString()
            .substring(0, 10);

    List<UnitsEntity> unitsList = await getAvailableUnitsUsecase
        .instantBookingRepository
        .getAvailableUnits(date);

    if (unitsList.isNotEmpty) {
      emit(AvailableUnitsLoaded(unitsList: unitsList));
    } else {
      emit(AvailableUnitsEmpty());
    }
  }

  void onScreenChanged(
      OnScreenChanged event, Emitter<AvailableUnitsState> emit) {
    emit(AvailableUnitsInitial());
  }
}
