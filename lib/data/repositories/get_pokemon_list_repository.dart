import 'package:projeto_pokedex/core/core.dart';
import 'package:projeto_pokedex/data/datasources/datasources.dart';
import 'package:projeto_pokedex/domain/entities/entities.dart';
import 'package:projeto_pokedex/domain/repositories/repositories.dart';

class GetPokemonListRepository extends IGetPokemonListRepository
    implements BaseRepository {
  final IGetPokemonListDatasource datasource;
  GetPokemonListRepository({required this.datasource});

  @override
  Future<ResultState<BaseFailure, List<PokemonListResultEntity>>>
      getPokemonListEntity({required int offset, required int limit}) async {
    return tryExecute<List<PokemonListResultEntity>>(() async {
      final List<PokemonListResultEntity> result = [];
      final response =
          await datasource.getPokemonListEntity(offset: offset, limit: limit);
      final PokemonListEntity pokemonListEntity =
          PokemonListEntity.fromMap(response);
      result.addAll(pokemonListEntity.results);
      return result;
    });
  }
}
