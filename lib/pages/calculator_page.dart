import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calculator_bloc.dart';
import '../event/calculator_event.dart';
import '../state/calculator_state.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final _controllerA = TextEditingController();
  final _controllerB = TextEditingController();

  double? _parse(String s) => double.tryParse(s);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('Calculator')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Input fields
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controllerA,
                      decoration: const InputDecoration(
                        hintText: 'Enter first number',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _controllerB,
                      decoration: const InputDecoration(
                        hintText: 'Enter second number',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Operation buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _onOperation(context, 'add'),
                      child: const Text('+'),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _onOperation(context, 'sub'),
                      child: const Text('-'),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _onOperation(context, 'mul'),
                      child: const Text('×'),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _onOperation(context, 'div'),
                      child: const Text('÷'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Result display
              BlocBuilder<CalculatorBloc, CalculatorState>(
                builder: (context, state) {
                  final res = state.result.isEmpty ? '-' : state.result;
                  return Text('Result: $res', style: const TextStyle(fontSize: 18));
                },
              ),

              // Spacer pushes Reset button to bottom
              const Spacer(),

              // Reset button full width
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _controllerA.clear();
                    _controllerB.clear();
                    context.read<CalculatorBloc>().add(ResetEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Reset',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onOperation(BuildContext context, String op) {
    final a = _parse(_controllerA.text);
    final b = _parse(_controllerB.text);

    if (a == null || b == null) {
      context.read<CalculatorBloc>().add(InvalidInputEvent());
      return;
    }

    switch (op) {
      case 'add':
        context.read<CalculatorBloc>().add(AddEvent(a, b));
        break;
      case 'sub':
        context.read<CalculatorBloc>().add(SubtractEvent(a, b));
        break;
      case 'mul':
        context.read<CalculatorBloc>().add(MultiplyEvent(a, b));
        break;
      case 'div':
        context.read<CalculatorBloc>().add(DivideEvent(a, b));
        break;
    }
  }
}
