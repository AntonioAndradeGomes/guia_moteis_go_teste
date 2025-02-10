part of 'moteis_bloc.dart';

sealed class MoteisState extends Equatable {
  final bool isNow;
  const MoteisState({this.isNow = true});
}

class MoteisLoading extends MoteisState {
  const MoteisLoading({super.isNow = true});

  @override
  List<Object?> get props => [isNow];
}

class MoteisSuccess extends MoteisState {
  final List<Motel> moteis;

  const MoteisSuccess(this.moteis, {super.isNow = true});

  @override
  List<Object> get props => [moteis, isNow];
}

class MoteisError extends MoteisState {
  final HttpException exception;

  const MoteisError(this.exception, {super.isNow = true});

  @override
  List<Object> get props => [exception, isNow];
}
