part of 'file_picker_bloc.dart';

@immutable
sealed class FilePickerEvent extends Equatable {
  const FilePickerEvent();
}

class InputFilePickerEvent extends FilePickerEvent {
  final String val;

  const InputFilePickerEvent({required this.val});

  @override
  List<Object> get props => [val];
}

class ResetFilePickerEvent extends FilePickerEvent {
  @override
  List<Object> get props => [];
}
