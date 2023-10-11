import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'number_event.dart';
part 'number_state.dart';

class NumberBloc extends Bloc<NumberEvent, NumberValueState> {
  NumberBloc()
      : super(
          const NumberValueState(number: "", message: ""),
        ) {
    on<InputNumberEvent>((event, emit) {
      String numberValue = event.val;
      String messageValue;
      messageValue = "";
      if (numberValue.isEmpty) {
        messageValue = "Tdak Boleh Kosong";
      } else if (!numberValue.startsWith('0')) {
        messageValue = "Harus Mulai Dengan 0";
      } else if (!RegExp(r'^[0-9]{8,15}$').hasMatch(numberValue)) {
        messageValue = "TIdak Boleh Kurang Dari 7 Angka";
      }

      emit(
        NumberValueState(
          number: numberValue,
          message: messageValue,
        ),
      );
    });
  }
}
