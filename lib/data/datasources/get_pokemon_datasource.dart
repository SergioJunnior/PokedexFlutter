import 'package:projeto_pokedex/core/infra/base_connector.dart';

abstract class IGetPokemonDatasource {
  Future<Map<String, dynamic>> getPokemonEntity({
    required int id,
  });
}

class GetPokemonDatasource extends IGetPokemonDatasource {
  final IBaseConnector baseConnector;
  GetPokemonDatasource({required this.baseConnector});

  @override
  Future<Map<String, dynamic>> getPokemonEntity({
    required int id,
  }) async {
    String endPoint = '/pokemon/$id';
    final response = await baseConnector.get(endPoint);
    return response.data;
  }
}
