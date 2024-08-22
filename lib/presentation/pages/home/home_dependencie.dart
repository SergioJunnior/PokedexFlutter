import 'package:projeto_pokedex/core/core.dart';
import 'package:projeto_pokedex/data/data.dart';
import 'package:projeto_pokedex/domain/domain.dart';

import 'home.dart';

class HomeDependecie extends BaseDependencies {
  @override
  void dependencies(Dependencies d) {
    // Datasource
    d.registerLazySingleton<IGetPokemonListDatasource>(
      () => GetPokemonListDatasource(
        baseConnector: d<IBaseConnector>(),
      ),
    );

    d.registerLazySingleton<IGetPokemonDatasource>(
      () => GetPokemonDatasource(
        baseConnector: d<IBaseConnector>(),
      ),
    );

    //Repository
    d.registerLazySingleton<IGetPokemonListRepository>(
      () => GetPokemonListRepository(
        datasource: d<IGetPokemonListDatasource>(),
      ),
    );

    d.registerLazySingleton<IGetPokemonRepository>(
      () => GetPokemonRepository(
        datasource: d<IGetPokemonDatasource>(),
      ),
    );

    //UseCases
    d.registerLazySingleton(
      () => GetPokemonListUsecase(
        getPokemonListRepository: d<IGetPokemonListRepository>(),
        getPokemonRepository: d<IGetPokemonRepository>(),
      ),
    );

    //Stores
    d.registerLazySingleton(
      () => HomeStore(
        d<GetPokemonListUsecase>(),
      ),
    );

    //Controller
    d.registerLazySingleton(
      () => HomeController(),
    );
  }
}
