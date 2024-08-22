import 'package:projeto_pokedex/core/core.dart';
import 'package:projeto_pokedex/domain/entities/entities.dart';

abstract class IGetPokemonListRepository extends BaseRepository {
  Future<ResultState<BaseFailure, List<PokemonListResultEntity>>>
      getPokemonListEntity({
    required int offset,
    required int limit,
  });
}
