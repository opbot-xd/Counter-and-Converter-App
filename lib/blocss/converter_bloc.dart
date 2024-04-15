import 'package:flutter_bloc/flutter_bloc.dart';
enum ConverterEvent { convertBinary }

class ConverterState {
  final String binaryInput;
  final int convertedNumber;

  const ConverterState({
    required this.binaryInput,
    required this.convertedNumber,
  });

  factory ConverterState.initial() => const ConverterState(
        binaryInput: "",
        convertedNumber: 0,
      );
}

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc() : super(ConverterState.initial());

  Stream<ConverterState> mapEventToState(ConverterEvent event) async* {
    switch (event) {
      case ConverterEvent.convertBinary:
        if (state.binaryInput.isNotEmpty) {
          int? value = int.tryParse(state.binaryInput, radix: 2);
          if (value != null) {
            yield ConverterState(
              binaryInput: state.binaryInput,
              convertedNumber: value,
            );
          }
        }
        break;
    }
  }
}
