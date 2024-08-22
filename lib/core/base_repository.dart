import 'package:flutter/material.dart';
import 'package:projeto_pokedex/core/error/base_failure.dart';
import 'package:projeto_pokedex/core/error/exceptions.dart';
import 'package:projeto_pokedex/core/result_state.dart';

abstract class BaseRepository {
  Future<ResultState<BaseFailure, E>> tryExecute<E>(
    Future<E> Function() exec, {
    BaseFailure Function(DataPersistenceException e)?
        onDataPersistenceException,
    BaseFailure Function(Exception e)? onOtherException,
  }) async {
    try {
      E result = await exec();
      return IsResult(result);
    } on DataPersistenceException catch (e, stackTrace) {
      if (onDataPersistenceException != null) {
        return IsError(onDataPersistenceException(e));
      }
      return IsError(DataPersistenceFailure(stackTrace: stackTrace));
    } on Exception catch (e, stackTrace) {
      if (onOtherException != null) return IsError(onOtherException(e));
      debugPrint('[ERROR RESPONSE REPOSITORY]: $e');
      return IsError(UnknownFailure(stackTrace: stackTrace));
    }
  }
}
