part of 'file_picker_bloc.dart';

@immutable
sealed class FilePickerState extends Equatable {
  const FilePickerState();
}

class FilePickerValueState extends FilePickerState {
  final String fileName;

  FilePickerValueState({required this.fileName});

  @override
  List<Object> get props => [fileName];
}
