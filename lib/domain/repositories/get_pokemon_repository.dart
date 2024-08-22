import 'package:projeto_pokedex/core/core.dart';
import 'package:projeto_pokedex/domain/entities/entities.dart';

abstract class IGetPokemonRepository extends BaseRepository {
  Future<ResultState<BaseFailure, PokemonEntity>> getPokemonEntity({
    required int id,
  });
}
