import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'convertor_event.dart';
part 'convertor_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc() : super(ConverterState(0));

  @override
  Stream<ConverterState> mapEventToState(ConverterEvent event) async* {
    if (event is ConvertBinaryEvent) {
      int? value = int.tryParse(event.binaryInput, radix: 2);
      if (value != null) {
        yield ConverterState(value);
      } else {
        // Handle invalid input
      }
    }
  }
}

class ConverterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConverterBloc(),
      child: ConverterView(),
    );
  }
}

class ConverterView extends StatelessWidget {
  final TextEditingController _binaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ConverterBloc converterBloc = BlocProvider.of<ConverterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Binary Converter'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: BlocBuilder<ConverterBloc, ConverterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _binaryController,
                  decoration: InputDecoration(
                    labelText: 'Enter Binary String',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    converterBloc
                        .add(ConvertBinaryEvent(_binaryController.text));
                  },
                  child: Text('Convert'),
                ),
                Text(
                  'Converted Number: ${state.convertedNumber}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ConverterPage(),
  ));
}
