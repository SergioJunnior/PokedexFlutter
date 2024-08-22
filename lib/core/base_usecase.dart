import 'package:projeto_pokedex/core/error/base_failure.dart';
import 'package:projeto_pokedex/core/result_state.dart';

abstract class BaseUsecase<Params, Result> {
  Future<ResultState<BaseFailure, Result>> execute(Params params);
}
