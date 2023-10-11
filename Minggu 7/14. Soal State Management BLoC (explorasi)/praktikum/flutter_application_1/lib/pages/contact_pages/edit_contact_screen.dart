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
import 'package:flutter_application_1/widget/date_picker_widget.dart';
import 'package:flutter_application_1/widget/file_picker_widget.dart';
import 'package:flutter_application_1/widget/text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HalamanEditContact extends StatelessWidget {
  HalamanEditContact({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  void editContact(String nameNew, String numberNew, String formatDateNew,
      Color colorsNew, String fileNew, int index, BuildContext context) {
    final contact =
        Contact(nameNew, numberNew, formatDateNew, colorsNew, fileNew);
    final ContactBloc contactBloc =
        BlocProvider.of<ContactBloc>(context, listen: false);
    contactBloc.add(EditContactEvent(val: contact, index: index));
    nameController.clear();
    numberController.clear();
    Navigator.of(context).popAndPushNamed('/contact');
  }

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)?.settings.arguments as int;
    final NameBloc nameData = BlocProvider.of<NameBloc>(context);
    final NumberBloc numberData = BlocProvider.of<NumberBloc>(context);
    final DatePickerBloc dateData = BlocProvider.of<DatePickerBloc>(context);
    final ColorPickerBloc colorData = BlocProvider.of<ColorPickerBloc>(context);
    final FilePickerBloc fileData = BlocProvider.of<FilePickerBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkpurpleColor,
        title: const Text(
          'Edit Data',
          style: TextStyle(
            color: lightpurpleColor,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/contact');
            },
          ),
        ],
      ),
      body: BlocBuilder<ContactBloc, ContactValueState>(
        builder: (context, stateContact) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Nama'),
                      Text(stateContact.contact[index].name),
                    ],
                  ),
                  BlocBuilder<NameBloc, NameValueState>(
                    builder: (context, stateName) {
                      return InputTextField(
                        controller: nameController,
                        labelText: 'Edit Nama',
                        hintText: 'Masukan nama baru',
                        errorText: stateName.message,
                        onChanged: (val) {
                          nameData.add(InputNameEvent(val: val));
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('No Telp'),
                      Text(stateContact.contact[index].phoneNumber),
                    ],
                  ),
                  BlocBuilder<NumberBloc, NumberValueState>(
                    builder: (context, stateNumber) {
                      return InputTextField(
                        controller: numberController,
                        labelText: 'Edit No Telp',
                        hintText: 'Masukan Nomor baru',
                        errorText: stateNumber.message,
                        onChanged: (val) {
                          numberData.add(InputNumberEvent(val: val));
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tanggal'),
                      Text(stateContact.contact[index].dateNow),
                    ],
                  ),
                  BlocBuilder<DatePickerBloc, DateValueState>(
                    builder: (context, stateDate) {
                      return CustomDatePicker(
                        currentDate: stateDate.selectDate,
                        selectedDate: stateDate.selectDate,
                        onDateSelected: (date) {
                          dateData.add(
                              InputDateEvent(valSelect: date, valFormat: date));
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<ColorPickerBloc, ColorValueState>(
                    builder: (context, stateColor) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Warna'),
                          Text(stateColor.color.toString()),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  BlocBuilder<ColorPickerBloc, ColorValueState>(
                    builder: (context, stateColor) {
                      return CustomColorPicker(
                        initialColor: stateColor.currentColor,
                        onColorChanged: (color) {
                          colorData.add(InputColorPickerEvent(
                              valSelect: color, valCurrent: color));
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<FilePickerBloc, FilePickerValueState>(
                    builder: (context, stateFile) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('File Sebelumnya'),
                          Text(stateContact.contact[index].fileNow,
                              overflow: TextOverflow.fade),
                        ],
                      );
                    },
                  ),
                  const CustomFilePicker(),
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
                                                  (stateNumber
                                                      .number.isNotEmpty) &&
                                                  stateDate.formattedDate
                                                      .isNotEmpty &&
                                                  stateColor.color !=
                                                      orangeColor &&
                                                  stateFile.fileName.isNotEmpty)
                                              ? () {
                                                  editContact(
                                                      state.name,
                                                      stateNumber.number,
                                                      stateDate.formattedDate,
                                                      stateColor.color,
                                                      stateFile.fileName,
                                                      index,
                                                      context);
                                                  dateData
                                                      .add(ResetDateEvent());
                                                  colorData.add(
                                                      ResetColorPickerEvent());
                                                  fileData.add(
                                                      ResetFilePickerEvent());
                                                }
                                              : null,
                                          child: const Text(
                                            'Edit',
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
