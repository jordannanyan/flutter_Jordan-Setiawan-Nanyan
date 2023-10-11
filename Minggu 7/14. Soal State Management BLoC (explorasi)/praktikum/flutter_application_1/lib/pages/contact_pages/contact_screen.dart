import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/color_picker_bloc/color_picker_bloc.dart';
import 'package:flutter_application_1/bloc/contact_bloc/contact_bloc.dart';
import 'package:flutter_application_1/bloc/date_picker_blog/date_picker_bloc.dart';
import 'package:flutter_application_1/bloc/file_picker_bloc/file_picker_bloc.dart';
import 'package:flutter_application_1/bloc/name_bloc/name_bloc.dart';
import 'package:flutter_application_1/bloc/number_state/number_bloc.dart';
import 'package:flutter_application_1/model/contact_list_model.dart';
import 'package:flutter_application_1/theme/theme_color.dart';
import 'package:flutter_application_1/widget/color_picker_widget.dart';
import 'package:flutter_application_1/widget/contact_list_widget.dart';
import 'package:flutter_application_1/widget/date_picker_widget.dart';
import 'package:flutter_application_1/widget/file_picker_widget.dart';
import 'package:flutter_application_1/widget/text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HalamanContact extends StatelessWidget {
  HalamanContact({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final DateTime currentDate = DateTime.now();

  void addContact(String nameNew, String numberNew, String formatDateNew,
      Color colorsNew, String fileNew, BuildContext context) {
    final contact = Contact(
      nameNew,
      numberNew,
      formatDateNew,
      colorsNew,
      fileNew,
    );
    final ContactBloc contactModel = BlocProvider.of<ContactBloc>(context);
    contactModel.add(InputContactEvent(val: contact));
    nameController.clear();
    numberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final NameBloc nameData = BlocProvider.of<NameBloc>(context);
    final NumberBloc numberData = BlocProvider.of<NumberBloc>(context);
    final DatePickerBloc dateData = BlocProvider.of<DatePickerBloc>(context);
    final ColorPickerBloc colorData = BlocProvider.of<ColorPickerBloc>(context);
    final FilePickerBloc fileData = BlocProvider.of<FilePickerBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkpurpleColor,
        title: const Text(
          'Interactive Widget',
          style: TextStyle(
            color: lightpurpleColor,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: darkpurpleColor,
        child: Column(
          children: [
            const SizedBox(
              height: 48,
            ),
            ListTile(
              title: const Text(
                "Contact",
                style: TextStyle(
                    color: lightgreyColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text(
                "Gambar",
                style: TextStyle(
                    color: lightgreyColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/',
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(color: blackColor, width: 1),
                  ),
                ),
                child: const Text(
                    'Tugas State Management Bloc Untuk Minggu 7 Flutter'),
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<NameBloc, NameValueState>(
                builder: (context, state) {
                  return InputTextField(
                    controller: nameController,
                    labelText: 'Name',
                    hintText: 'Insert your name',
                    errorText: state.message,
                    onChanged: (val) {
                      nameData.add(
                        InputNameEvent(
                          val: val,
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<NumberBloc, NumberValueState>(
                builder: (context, state) {
                  return InputTextField(
                    controller: numberController,
                    labelText: 'Nomor',
                    hintText: '08...',
                    errorText: state.message,
                    onChanged: (val) {
                      numberData.add(
                        InputNumberEvent(
                          val: val,
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                child: BlocBuilder<DatePickerBloc, DateValueState>(
                  builder: (context, state) {
                    return CustomDatePicker(
                      currentDate: currentDate,
                      selectedDate: state.selectDate,
                      onDateSelected: (date) {
                        dateData.add(
                          InputDateEvent(
                            valSelect: date,
                            valFormat: date,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<ColorPickerBloc, ColorValueState>(
                builder: (context, state) {
                  return CustomColorPicker(
                    initialColor: state.currentColor,
                    onColorChanged: (color) {
                      colorData.add(
                        InputColorPickerEvent(
                          valSelect: color,
                          valCurrent: color,
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomFilePicker(),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<FilePickerBloc, FilePickerValueState>(
                builder: (context, stateFile) {
                  return BlocBuilder<ColorPickerBloc, ColorValueState>(
                    builder: (context, stateColor) {
                      return BlocBuilder<DatePickerBloc, DateValueState>(
                        builder: (context, stateDate) {
                          return BlocBuilder<NumberBloc, NumberValueState>(
                            builder: (context, stateNumber) {
                              return BlocBuilder<NameBloc, NameValueState>(
                                builder: (context, state) {
                                  return Container(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                darkpurpleColor),
                                      ),
                                      onPressed: ((state.name.isNotEmpty) &&
                                              (stateNumber.number.isNotEmpty) &&
                                              stateDate
                                                  .formattedDate.isNotEmpty &&
                                              stateColor.color != orangeColor &&
                                              stateFile.fileName.isNotEmpty)
                                          ? () {
                                              addContact(
                                                state.name,
                                                stateNumber.number,
                                                stateDate.formattedDate,
                                                stateColor.color,
                                                stateFile.fileName,
                                                context,
                                              );
                                              dateData.add(ResetDateEvent());
                                              colorData
                                                  .add(ResetColorPickerEvent());
                                              fileData
                                                  .add(ResetFilePickerEvent());
                                            }
                                          : null,
                                      child: const Text(
                                        'Submit',
                                        style: TextStyle(
                                          color: lightpurpleColor,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 49,
              ),
              Column(
                children: [
                  const Text(
                    "List Contact",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: lightblackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<ContactBloc, ContactValueState>(
                    builder: (context, state) {
                      return ContactList(
                        onEdit: (index) {
                          // _showEditDialog(context, index);
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
