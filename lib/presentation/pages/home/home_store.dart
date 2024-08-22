import 'package:mobx/mobx.dart';
import 'package:projeto_pokedex/domain/domain.dart';

part 'home_store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final GetPokemonListUsecase getPokemonListUsecase;
  _HomeStoreBase(this.getPokemonListUsecase);

  @observable
  ObservableList<PokemonEntity> pokemonList = ObservableList<PokemonEntity>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  int offset = 0;

  @action
  Future<void> fetchPokemonList({required int limit}) async {
    if (isLoading) return;
    isLoading = true;
    errorMessage = null;
    final result = await getPokemonListUsecase(limit: limit, offset: offset);
    result.map(
      (data) {
        pokemonList.addAll(data);
        offset += limit;
      },
      (error) {
        errorMessage = "Failed to load Pokemon List: ${error.message}";
      },
    );
    isLoading = false;
  }
}
