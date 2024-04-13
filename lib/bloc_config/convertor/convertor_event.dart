part of 'convertor_page.dart';

abstract class ConverterEvent {}

class ConvertBinaryEvent extends ConverterEvent {
  final String binaryInput;

  ConvertBinaryEvent(this.binaryInput);
}