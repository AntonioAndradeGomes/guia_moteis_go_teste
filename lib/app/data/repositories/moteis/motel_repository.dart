import 'package:guia_moteis_go_teste/app/domain/models/motel.dart';
import 'package:result_dart/result_dart.dart';

abstract class MotelRepository {
  AsyncResult<List<Motel>> getAllMotels();
}
