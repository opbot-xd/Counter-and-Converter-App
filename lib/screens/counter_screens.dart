// screens/counter_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  String displayedValue = state.isBinary
                      ? state.count.toRadixString(2).padLeft(8, '0')
                      : state.count.toString();
                  print("State updated: $state"); // for debugging
                  return Text(
                    displayedValue,
                    style: TextStyle(fontSize: 24),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => context.read<CounterBloc>().add(CounterEvent.increment),
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => context.read<CounterBloc>().add(CounterEvent.decrement),
                  ),
                ],
              ),
              Switch(
                value: context.read<CounterBloc>().state.isBinary,
                onChanged: (value) => context.read<CounterBloc>().add(CounterEvent.toggleBinary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
