import 'package:mobx/mobx.dart';
import 'package:projeto_pokedex/core/core.dart';
import 'package:projeto_pokedex/domain/entities/entities.dart';

import 'home_store.dart';

class HomeController {
  final HomeStore pokemonStore = Dependencies.I<HomeStore>();

  void fetchPokemonList({required int limit}) {
    pokemonStore.fetchPokemonList(limit: limit);
  }

  ObservableList<PokemonEntity> get pokemonList => pokemonStore.pokemonList;

  bool get isLoading => pokemonStore.isLoading;

  String? get errorMessage => pokemonStore.errorMessage;

  searchPokemon({required String value, required PokemonEntity pokemon}) async {
    final searchTextLower = value.toLowerCase();
    return pokemon.name.toLowerCase().contains(searchTextLower);
  }
}
