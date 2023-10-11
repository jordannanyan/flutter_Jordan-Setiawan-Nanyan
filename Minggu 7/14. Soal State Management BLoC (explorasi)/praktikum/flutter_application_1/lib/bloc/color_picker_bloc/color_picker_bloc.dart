import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/theme_color.dart';
import 'package:meta/meta.dart';

part 'color_picker_event.dart';
part 'color_picker_state.dart';

class ColorPickerBloc extends Bloc<ColorPickerEvent, ColorValueState> {
  ColorPickerBloc()
      : super(const ColorValueState(
            color: orangeColor, currentColor: orangeColor)) {
    on<InputColorPickerEvent>((event, emit) {
      final Color selectedColor = event.valSelect;
      final Color currentColor = event.valCurrent;

      emit(
        ColorValueState(
          color: selectedColor,
          currentColor: currentColor,
        ),
      );
    });
    on<ResetColorPickerEvent>((event, emit) {
      emit(
          const ColorValueState(color: orangeColor, currentColor: orangeColor));
    });
  }
}
