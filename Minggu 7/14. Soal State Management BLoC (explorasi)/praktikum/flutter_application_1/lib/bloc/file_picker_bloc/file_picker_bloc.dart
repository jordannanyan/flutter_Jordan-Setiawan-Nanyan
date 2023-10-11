import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'file_picker_event.dart';
part 'file_picker_state.dart';

class FilePickerBloc extends Bloc<FilePickerEvent, FilePickerValueState> {
  FilePickerBloc() : super(FilePickerValueState(fileName: "")) {
    on<InputFilePickerEvent>((event, emit) {
      final String fileNameValue;
      fileNameValue = event.val;

      emit(
        FilePickerValueState(
          fileName: fileNameValue,
        ),
      );
    });
    on<ResetFilePickerEvent>((event, emit) {
      emit(FilePickerValueState(fileName: ""));
    });
  }
}
