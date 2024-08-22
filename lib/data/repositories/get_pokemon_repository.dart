import 'package:projeto_pokedex/core/core.dart';
import 'package:projeto_pokedex/data/datasources/datasources.dart';
import 'package:projeto_pokedex/domain/entities/entities.dart';
import 'package:projeto_pokedex/domain/repositories/repositories.dart';

class GetPokemonRepository extends IGetPokemonRepository
    implements BaseRepository {
  final IGetPokemonDatasource datasource;

  GetPokemonRepository({required this.datasource});

  @override
  Future<ResultState<BaseFailure, PokemonEntity>> getPokemonEntity(
      {required int id}) async {
    return tryExecute<PokemonEntity>(() async {
      final response = await datasource.getPokemonEntity(id: id);
      return PokemonEntity.fromJson(response);
    });
  }
}
