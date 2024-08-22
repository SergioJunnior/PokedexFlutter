import 'package:projeto_pokedex/core/infra/base_connector.dart';

abstract class IGetPokemonListDatasource {
  Future<Map<String, dynamic>> getPokemonListEntity({
    required int offset,
    required int limit,
  });
}

class GetPokemonListDatasource extends IGetPokemonListDatasource {
  final IBaseConnector baseConnector;

  GetPokemonListDatasource({required this.baseConnector});

  @override
  Future<Map<String, dynamic>> getPokemonListEntity({
    required int offset,
    required int limit,
  }) async {
    String endpoint = '/pokemon?offset=$offset&limit=$limit';
    final response = await baseConnector.get(endpoint);
    return response.data;
  }
}
