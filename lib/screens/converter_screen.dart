// screens/converter_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocss/converter_bloc.dart';

class ConverterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConverterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Binary Converter'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ConverterBloc, ConverterState>(
                builder: (context, state) => TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Binary String',
                  ),
                  onChanged: (value) => context.read<ConverterBloc>().add(ConverterEvent.convertBinary),
                ),
              ),
              ElevatedButton(
                onPressed: () => context.read<ConverterBloc>().add(ConverterEvent.convertBinary),
                child: Text('Convert'),
              ),
              BlocBuilder<ConverterBloc, ConverterState>(
                builder: (context, state) => Text(
                  'Converted Number: ${state.convertedNumber.toString()}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
