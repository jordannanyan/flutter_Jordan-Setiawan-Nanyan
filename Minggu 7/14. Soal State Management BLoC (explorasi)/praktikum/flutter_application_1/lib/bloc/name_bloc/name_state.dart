part of 'name_bloc.dart';

@immutable
sealed class NameState extends Equatable {
  const NameState();
}

class NameValueState extends NameState {
  final String name;
  final String message;

  const NameValueState({
    required this.message,
    required this.name,
  });

  @override
  List<Object> get props => [name, message];
}
