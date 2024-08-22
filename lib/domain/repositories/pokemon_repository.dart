import 'package:projeto_pokedex/core/core.dart';
import 'package:projeto_pokedex/domain/entities/entities.dart';

abstract interface class IPokemonsRepository extends BaseRepository {
  Future<ResultState<BaseFailure, PokemonListEntity>> getPokemonListEntity({
    required int offSet,
    required int limit,
  });
  Future<ResultState<BaseFailure, PokemonEntity>> getPokemonEntity({
    required int id,
  });
  Future<ResultState<BaseFailure, MoveEntity>> updateMovePokemon({
    required PokemonEntity pokemon,
    required String moveName,
  });
  Future<ResultState<BaseFailure, List<PokemonEntity>>> updateEvolutions({
    required String pokemonName,
  });
}
