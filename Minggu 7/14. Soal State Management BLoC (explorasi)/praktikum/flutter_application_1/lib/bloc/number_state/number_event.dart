part of 'number_bloc.dart';

@immutable
sealed class NumberEvent extends Equatable {
  const NumberEvent();
}

class InputNumberEvent extends NumberEvent {
  final String val;

  const InputNumberEvent({
    required this.val,
  });

  @override
  List<Object> get props => [val];
}
