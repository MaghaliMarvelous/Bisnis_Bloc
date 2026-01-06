import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_belajar_bilog/pages/calculator_page.dart';
import 'package:flutter_belajar_bilog/bloc/calculator_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => CalculatorBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorPage(), 
    );
  }
}
