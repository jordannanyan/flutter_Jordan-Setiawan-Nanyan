part of 'contact_bloc.dart';

@immutable
sealed class ContactEvent extends Equatable {
  const ContactEvent();
}

class InputContactEvent extends ContactEvent {
  final Contact val;

  const InputContactEvent({required this.val});

  @override
  List<Object> get props => [val];
}

class EditContactEvent extends ContactEvent {
  final Contact val;
  final int index;

  const EditContactEvent({required this.val, required this.index});

  @override
  List<Object> get props => [val, index];
}

class DeleteContactEvent extends ContactEvent {
  final int val;

  const DeleteContactEvent({required this.val});

  @override
  List<Object> get props => [val];
}
