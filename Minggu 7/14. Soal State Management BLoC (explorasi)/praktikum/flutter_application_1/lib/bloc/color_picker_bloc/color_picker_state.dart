part of 'color_picker_bloc.dart';

@immutable
sealed class ColorPickerState extends Equatable {
  const ColorPickerState();
}

class ColorValueState extends ColorPickerState {
  final Color color;
  final Color currentColor;

  const ColorValueState({
    required this.color,
    required this.currentColor,
  });

  @override
  List<Object> get props => [
        color,
        currentColor,
      ];
}
