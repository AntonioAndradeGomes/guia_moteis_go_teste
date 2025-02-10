part of 'moteis_bloc.dart';

sealed class MoteisEvent extends Equatable {
  final bool isNow;

  const MoteisEvent({this.isNow = true});
}

final class MoteisFetch extends MoteisEvent {
  const MoteisFetch({super.isNow = true});
  @override
  List<Object?> get props => [isNow];
}
