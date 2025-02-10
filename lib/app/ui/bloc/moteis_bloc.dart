import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_moteis_go_teste/app/data/exception/http_exception.dart';
import 'package:guia_moteis_go_teste/app/data/repositories/moteis/motel_repository.dart';
import 'package:guia_moteis_go_teste/app/domain/models/motel.dart';

part 'moteis_event.dart';
part 'moteis_state.dart';

class MoteisBloc extends Bloc<MoteisEvent, MoteisState> {
  final MotelRepository _motelRepository;
  MoteisBloc({
    required MotelRepository motelRepository,
  })  : _motelRepository = motelRepository,
        super(MoteisLoading()) {
    on<MoteisFetch>(_fetchMoteis);
  }

  void _fetchMoteis(MoteisEvent event, Emitter<MoteisState> emit) async {
    emit(MoteisLoading(isNow: event.isNow));
    final result = await _motelRepository.getAllMotels();
    result.fold(
      (motels) => emit(
        MoteisSuccess(motels, isNow: event.isNow),
      ),
      (error) => emit(
        MoteisError(error as HttpException, isNow: event.isNow),
      ),
    );
  }
}
