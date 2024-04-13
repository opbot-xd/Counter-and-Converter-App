part of 'counter_page.dart';

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class ToggleBinaryEvent extends CounterEvent {}
