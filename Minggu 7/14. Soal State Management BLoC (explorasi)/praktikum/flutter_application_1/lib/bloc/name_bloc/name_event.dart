part of 'name_bloc.dart';

@immutable
sealed class NameEvent extends Equatable {
  const NameEvent();
}

class InputNameEvent extends NameEvent {
  final String val;

  const InputNameEvent({
    required this.val,
  });

  @override
  List<Object> get props => [val];
}
