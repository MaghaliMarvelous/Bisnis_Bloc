import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/calculator_event.dart';
import '../state/calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState.initial()) {
    on<AddEvent>(_onAdd);
    on<SubtractEvent>(_onSubtract);
    on<MultiplyEvent>(_onMultiply);
    on<DivideEvent>(_onDivide);
    on<ResetEvent>(_onReset);
    on<InvalidInputEvent>(_onInvalid);
  }

  void _onAdd(AddEvent event, Emitter<CalculatorState> emit) {
    emit(state.copyWith(result: (event.a + event.b).toString()));
  }

  void _onSubtract(SubtractEvent event, Emitter<CalculatorState> emit) {
    emit(state.copyWith(result: (event.a - event.b).toString()));
  }

  void _onMultiply(MultiplyEvent event, Emitter<CalculatorState> emit) {
    emit(state.copyWith(result: (event.a * event.b).toString()));
  }

  void _onDivide(DivideEvent event, Emitter<CalculatorState> emit) {
    if (event.b == 0) {
      emit(state.copyWith(result: 'Error: division by zero'));
    } else {
      emit(state.copyWith(result: (event.a / event.b).toString()));
    }
  }

  void _onReset(ResetEvent event, Emitter<CalculatorState> emit) {
    emit(CalculatorState.initial());
  }

  void _onInvalid(InvalidInputEvent event, Emitter<CalculatorState> emit) {
    emit(state.copyWith(result: 'Invalid input'));
  }
}
