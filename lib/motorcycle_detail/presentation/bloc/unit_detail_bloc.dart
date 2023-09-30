import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'unit_detail_event.dart';
part 'unit_detail_state.dart';

class UnitDetailBloc extends Bloc<UnitDetailEvent, UnitDetailState> {
  UnitDetailBloc() : super(MotorcycleDetailInitial()) {}
}
