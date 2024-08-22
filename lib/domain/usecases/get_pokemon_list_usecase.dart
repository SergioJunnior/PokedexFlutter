import 'package:projeto_pokedex/core/core.dart';
import 'package:projeto_pokedex/domain/entities/entities.dart';
import 'package:projeto_pokedex/domain/repositories/repositories.dart';

class GetPokemonListUsecase {
  final IGetPokemonListRepository getPokemonListRepository;
  final IGetPokemonRepository getPokemonRepository;
  GetPokemonListUsecase({
    required this.getPokemonListRepository,
    required this.getPokemonRepository,
  });

  Future<ResultState<BaseFailure, List<PokemonEntity>>> call(
      {required int offset, required int limit}) async {
    try {
      List<PokemonEntity> pokemonList = [];
      final resultList = await getPokemonListRepository.getPokemonListEntity(
          offset: offset, limit: limit);
      if (resultList.isSuccess()) {
        final pokemonNameIdList = resultList.getOrElse(() => []);
        for (var pokemon in pokemonNameIdList) {
          final entityResult = await getPokemonRepository.getPokemonEntity(
              id: int.parse(extractPokemonId(pokemon.url)));
          if (entityResult.isSuccess()) {
            final pokemonEntity =
                entityResult.getOrElse(() => PokemonEntity.fromJson({}));
            pokemonList.add(pokemonEntity);
          }
        }
        return IsResult(pokemonList);
      } else {
        return IsError<BaseFailure, List<PokemonEntity>>(Object as BaseFailure);
      }
    } catch (e) {
      return IsError<BaseFailure, List<PokemonEntity>>(Object as BaseFailure);
    }
  }
}
