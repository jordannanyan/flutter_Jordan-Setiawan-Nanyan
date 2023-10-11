import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/file_picker_bloc/file_picker_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';

class CustomFilePicker extends StatelessWidget {
  const CustomFilePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final FilePickerBloc fileData = BlocProvider.of<FilePickerBloc>(context);

    return BlocBuilder<FilePickerBloc, FilePickerValueState>(
      builder: (context, state) {
        return Column(
          children: [
            const Text('Pick File'),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                child: const Text('Pick and Open File'),
                onPressed: () {
                  _pickFile(fileData);
                },
              ),
            ),
            const SizedBox(height: 16),
            Text('Selected File: ${state.fileName}'),
          ],
        );
      },
    );
  }

  void _pickFile(FilePickerBloc fileData) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
    fileData.add(InputFilePickerEvent(val: file.name));
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
