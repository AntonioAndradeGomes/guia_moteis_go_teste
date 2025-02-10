import 'package:guia_moteis_go_teste/app/core/exceptions/app_exception.dart';

class HttpException extends AppException {
  final int? statusCode;

  HttpException(
    super.message, {
    this.statusCode,
    super.stackTrace,
  });
}
