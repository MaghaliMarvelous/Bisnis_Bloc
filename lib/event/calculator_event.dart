abstract class CalculatorEvent {}

class AddEvent extends CalculatorEvent {
  final double a;
  final double b;
  AddEvent(this.a, this.b);
}

class SubtractEvent extends CalculatorEvent {
  final double a;
  final double b;
  SubtractEvent(this.a, this.b);
}

class MultiplyEvent extends CalculatorEvent {
  final double a;
  final double b;
  MultiplyEvent(this.a, this.b);
}

class DivideEvent extends CalculatorEvent {
  final double a;
  final double b;
  DivideEvent(this.a, this.b);
}

class ResetEvent extends CalculatorEvent {}

class InvalidInputEvent extends CalculatorEvent {}
