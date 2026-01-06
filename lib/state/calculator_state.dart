class CalculatorState {
  final String result;

  const CalculatorState({required this.result});

  factory CalculatorState.initial() => const CalculatorState(result: '');

  CalculatorState copyWith({String? result}) {
    return CalculatorState(result: result ?? this.result);
  }
}
