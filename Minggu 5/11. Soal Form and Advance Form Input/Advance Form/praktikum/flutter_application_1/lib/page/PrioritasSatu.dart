import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class PrioritasSatu extends StatefulWidget {
  const PrioritasSatu({super.key});

  @override
  State<PrioritasSatu> createState() => _PrioritasSatuState();
}

class _PrioritasSatuState extends State<PrioritasSatu> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.orange;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Interactive Widget'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Date'),
                  TextButton(
                    child: const Text('Select'),
                    onPressed: () async {
                      final selectDate = await showDatePicker(
                        context: context,
                        initialDate: currentDate,
                        firstDate: DateTime(1970),
                        lastDate: DateTime(currentDate.year + 50),
                      );
                      setState(() {
                        if (selectDate != null) {
                          _dueDate = selectDate;
                        }
                      });
                    },
                  )
                ],
              ),
              Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
              const SizedBox(
                height: 16,
              ),
              const Text('Color'),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: _currentColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_currentColor),
                  ),
                  child: const Text('Pick Color'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Pick Your Color'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                                pickerColor: _currentColor,
                                onColorChanged: (color) {
                                  setState(() {
                                    _currentColor = color;
                                  });
                                }),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Saver'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text('Pick File'),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Pick and Open File'),
                  onPressed: () {
                    _pickFile();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
