import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'date_picker_event.dart';
part 'date_picker_state.dart';

class DatePickerBloc extends Bloc<DatePickerEvent, DateValueState> {
  DatePickerBloc()
      : super(
          DateValueState(
            selectDate: DateTime.now(),
            formattedDate: "",
          ),
        ) {
    on<InputDateEvent>((event, emit) {
      final DateTime dateSelectData = event.valSelect;
      final DateTime dateFormatData = event.valFormat;
      emit(
        DateValueState(
          selectDate: dateSelectData,
          formattedDate: DateFormat('dd-MM-yyyy').format(dateFormatData),
        ),
      );
    });
    on<ResetDateEvent>((event, emit) {
      emit(DateValueState(selectDate: DateTime.now(), formattedDate: ""));
    });
  }
}
