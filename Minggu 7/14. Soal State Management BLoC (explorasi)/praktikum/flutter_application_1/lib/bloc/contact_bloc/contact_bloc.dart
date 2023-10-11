import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model/contact_list_model.dart';
import 'package:meta/meta.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactValueState> {
  ContactBloc()
      : super(
          const ContactValueState(contact: []),
        ) {
    on<InputContactEvent>((event, emit) {
      final updatedList = List<Contact>.from(state.contact);
      updatedList.add(event.val);
      emit(ContactValueState(contact: updatedList));
    });
    on<DeleteContactEvent>((event, emit) {
      final updatedList = List<Contact>.from(state.contact);
      updatedList.removeAt(event.val);
      emit(ContactValueState(contact: updatedList));
    });

    on<EditContactEvent>((event, emit) {
      final updatedList = List<Contact>.from(state.contact);
      updatedList[event.index] = event.val;

      emit(ContactValueState(contact: updatedList));
    });
  }
}
