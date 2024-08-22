import 'package:dio/dio.dart';
import 'package:projeto_pokedex/core/core.dart';

import '../presentation/pages/home/home_dependencie.dart';

class AppDependecies extends BaseDependencies {
  @override
  void dependencies(Dependencies d) {
    d.registerSingleton<Dio>(
      Dio(
        BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/'),
      ),
    );
    d.registerLazySingleton<IBaseConnector>(
      () => BaseConnector(
        dio: d<Dio>(),
      ),
    );
    HomeDependecie().dependencies(d);
  }
}
