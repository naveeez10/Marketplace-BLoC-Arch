import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class RegisterModule {
  @prod
  @lazySingleton
  Dio get dioProd => Dio(BaseOptions(
      baseUrl: "https://dev2be.oruphones.com/api/v1/global/assignment"));

  @prod
  @lazySingleton
  Logger get loggerProd =>
      Logger(printer: PrettyPrinter(lineLength: 80, methodCount: 1));
}
