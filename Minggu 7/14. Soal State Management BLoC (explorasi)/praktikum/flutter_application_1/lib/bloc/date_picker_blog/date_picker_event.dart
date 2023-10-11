part of 'date_picker_bloc.dart';

@immutable
sealed class DatePickerEvent extends Equatable {
  const DatePickerEvent();
}

class InputDateEvent extends DatePickerEvent {
  final DateTime valSelect;
  final DateTime valFormat;

  const InputDateEvent({
    required this.valSelect,
    required this.valFormat,
  });

  @override
  List<Object> get props => [valSelect, valFormat];
}

class ResetDateEvent extends DatePickerEvent {
  @override
  List<Object> get props => [];
}
