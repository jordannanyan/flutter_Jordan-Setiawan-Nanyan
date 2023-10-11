import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'name_event.dart';
part 'name_state.dart';

class NameBloc extends Bloc<NameEvent, NameValueState> {
  NameBloc()
      : super(
          const NameValueState(name: "", message: ""),
        ) {
    on<InputNameEvent>(
      (event, emit) {
        String nameValue = event.val;
        String messageValue = "";

        if (nameValue.isEmpty) messageValue = "Nama Tidak Boleh Kosong";
        final words = nameValue.split(' ');
        if (words.length < 2) messageValue = "Harus Lebih Dari 2";
        for (final word in words) {
          if (!RegExp(r'^[A-Z][a-zA-Z]*$').hasMatch(word)) {
            messageValue = "Tidak Boleh Ada Karakter Khusus";
          }
        }

        emit(
          NameValueState(
            name: nameValue,
            message: messageValue,
          ),
        );
      },
    );
  }
}
