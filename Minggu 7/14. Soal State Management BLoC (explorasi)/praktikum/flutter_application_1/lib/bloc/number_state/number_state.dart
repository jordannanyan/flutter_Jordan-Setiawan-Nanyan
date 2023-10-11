part of 'number_bloc.dart';

@immutable
sealed class NumberState extends Equatable {
  const NumberState();
}

class NumberValueState extends NumberState {
  final String number;
  final String message;

  const NumberValueState({
    required this.number,
    required this.message,
  });

  @override
  List<Object> get props => [number, message];
}
