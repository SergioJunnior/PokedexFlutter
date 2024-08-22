import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_pokedex/core/dependencies/dependencies_get_it.dart';
import 'package:projeto_pokedex/domain/entities/pokemon_color.dart';
import 'package:projeto_pokedex/shared/widgets/card_pokemon_widget.dart';
import 'package:projeto_pokedex/shared/widgets/loading_widget_vertical.dart';
import 'package:projeto_pokedex/shared/widgets/search_widget.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchPokemon;
  late HomeController controller;
  final ScrollController _scrollController = ScrollController();

  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    searchPokemon = TextEditingController();
    controller = Dependencies.I<HomeController>();
    controller.fetchPokemonList(limit: 50);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !controller.isLoading) {
        controller.fetchPokemonList(limit: 50);
      }
    });

    searchPokemon.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    searchPokemon.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: SearchWidget(
          isSearching: isSearching,
          controller: searchPokemon,
          onChanged: (v) {
            setState(
              () {
                v = searchPokemon.text;
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(
                () {
                  if (isSearching) searchPokemon.clear();
                  isSearching = !isSearching;
                },
              );
            },
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading && controller.pokemonList.isEmpty) {
            return const LoadingWidgetVertical(
              index: 5,
            );
          }

          if (controller.errorMessage != null) {
            return Center(
              child: Text(controller.errorMessage!),
            );
          }

          final filteredPokemonList = controller.pokemonList.where(
            (pokemon) {
              return pokemon.name.toLowerCase().contains(
                    searchPokemon.text.toLowerCase(),
                  );
            },
          ).toList();

          return ListView.builder(
            controller: _scrollController,
            itemCount: filteredPokemonList.isEmpty
                ? 1
                : filteredPokemonList.length + 1,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              if (filteredPokemonList.isEmpty) {
                return const Center(
                  child: Text('No Pokemon Found'),
                );
              }
              if (index == filteredPokemonList.length) {
                return controller.isLoading
                    ? const LoadingWidgetVertical(index: 5)
                    : const SizedBox.shrink();
              }

              final pokemon = filteredPokemonList[index];
              final pokemonType = PokemonType.values.firstWhere(
                (type) => type.tag.name == pokemon.types.first.type.name,
                orElse: () => PokemonType.normal,
              );
              return CardPokemonWidget(
                id: pokemon.id.toString(),
                name: pokemon.name,
                image: pokemon.sprites.other?.showdown?.frontDefault ?? '',
                color: pokemonType.tag.color,
                icon: pokemonType.tag.icon,
              );
            },
          );
        },
      ),
    );
  }
}
