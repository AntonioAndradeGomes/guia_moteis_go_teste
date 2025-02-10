import 'package:guia_moteis_go_teste/app/data/repositories/moteis/motel_repository.dart';
import 'package:guia_moteis_go_teste/app/data/services/moteis/motel_client_http.dart';
import 'package:guia_moteis_go_teste/app/domain/models/motel.dart';
import 'package:result_dart/result_dart.dart';

class MotelRepositoryRemote extends MotelRepository {
  final MotelClientHttp _motelClientHttp;

  MotelRepositoryRemote({
    required MotelClientHttp motelClientHttp,
  }) : _motelClientHttp = motelClientHttp;

  @override
  AsyncResult<List<Motel>> getAllMotels() {
    return _motelClientHttp.getMoteis();
  }
}
