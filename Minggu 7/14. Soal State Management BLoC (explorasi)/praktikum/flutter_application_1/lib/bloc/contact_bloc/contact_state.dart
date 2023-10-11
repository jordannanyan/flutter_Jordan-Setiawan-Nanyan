part of 'contact_bloc.dart';

@immutable
sealed class ContactState extends Equatable {
  const ContactState();
}

class ContactValueState extends ContactState {
  final List<Contact> contact;

  const ContactValueState({required this.contact});

  @override
  List<Object> get props => [contact];
}
