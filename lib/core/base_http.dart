import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pokedex/core/error/exceptions.dart';
import 'package:projeto_pokedex/core/infra/base_http_interface.dart';

class BaseHttp implements IBaseHttp {
  final Dio _dio;

  BaseHttp(this._dio);

  @override
  Future<Response> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response;
    } on DioException catch (e) {
      debugPrint("Dio Exception: ${e.message}");
      if (e.response?.statusCode != null) {
        throw ServerException(
            statusCode: e.response?.statusCode ?? 0,
            statusMessage: e.response?.statusMessage ?? '',
            dataMessage: e.response?.data.toString() ?? '');
      } else {
        throw NoConnectionException();
      }
    } on TypeError {
      throw DataPersistenceException();
    } catch (e) {
      debugPrint("Unexpected Exception: ${e.toString()}");
      throw NoConnectionException();
    }
  }
}
