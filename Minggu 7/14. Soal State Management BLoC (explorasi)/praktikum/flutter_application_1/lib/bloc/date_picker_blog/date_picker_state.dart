part of 'date_picker_bloc.dart';

@immutable
sealed class DatePickerState extends Equatable {
  const DatePickerState();
}

class DateValueState extends DatePickerState {
  final DateTime selectDate;
  final String formattedDate;

  const DateValueState({
    required this.selectDate,
    required this.formattedDate,
  });

  @override
  List<Object> get props => [selectDate, formattedDate];
}
