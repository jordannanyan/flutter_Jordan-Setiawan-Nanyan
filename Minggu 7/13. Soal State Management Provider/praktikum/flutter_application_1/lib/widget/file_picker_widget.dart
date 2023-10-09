import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/form_model.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

class CustomFilePicker extends StatelessWidget {
  const CustomFilePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final formData = Provider.of<FormDataProvider>(context);

    return Column(
      children: [
        const Text('Pick File'),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            child: const Text('Pick and Open File'),
            onPressed: () {
              _pickFile(formData);
            },
          ),
        ),
        const SizedBox(height: 16),
        Text('Selected File: ${formData.formData.fileName}'),
      ],
    );
  }

  void _pickFile(FormDataProvider formData) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
    formData.updateFileName(file.name);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
