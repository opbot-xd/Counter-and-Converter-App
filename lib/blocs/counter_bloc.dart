import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment, decrement, toggleBinary }

class CounterState {
  final int count;
  final bool isBinary;

  const CounterState({
    required this.count,
    required this.isBinary,
  });

  factory CounterState.initial() =>
      const CounterState(count: 0, isBinary: false);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CounterState &&
        other.count == count &&
        other.isBinary == isBinary;
  }

  @override
  int get hashCode => count.hashCode ^ isBinary.hashCode;
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield CounterState(count: state.count + 1, isBinary: state.isBinary);
        break;
      case CounterEvent.decrement:
        yield CounterState(
            count: state.count > 0 ? state.count - 1 : 0,
            isBinary: state.isBinary);
        break;
      case CounterEvent.toggleBinary:
        yield CounterState(count: state.count, isBinary: !state.isBinary);
        break;
    }
  }
}
