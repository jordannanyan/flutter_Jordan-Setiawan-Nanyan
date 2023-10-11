part of 'color_picker_bloc.dart';

@immutable
sealed class ColorPickerEvent extends Equatable {
  const ColorPickerEvent();
}

class InputColorPickerEvent extends ColorPickerEvent {
  final Color valSelect;
  final Color valCurrent;

  const InputColorPickerEvent({
    required this.valSelect,
    required this.valCurrent,
  });

  @override
  List<Object> get props => [valSelect, valCurrent];
}

class ResetColorPickerEvent extends ColorPickerEvent {
  @override
  List<Object> get props => [];
}
