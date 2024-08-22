import 'package:dio/dio.dart';
import 'package:projeto_pokedex/core/base_http.dart';

import 'base_http_interface.dart';

abstract interface class IBaseConnector implements IBaseHttp {}

class BaseConnector extends BaseHttp implements IBaseConnector {
  final Dio dio;

  BaseConnector({required this.dio}) : super(dio);
}
