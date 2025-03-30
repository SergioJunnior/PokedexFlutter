import 'package:flutter/material.dart';
import 'package:projeto_pokedex/domain/entities/type_entity.dart';

import '../../domain/entities/pokemon_color.dart';

class CardPokemonWidget extends StatelessWidget {
  const CardPokemonWidget({
    required this.id,
    required this.name,
    required this.color,
    required this.image,
    required this.pokemonType,
    this.icon,
    super.key,
  });
  final String id;
  final String name;
  final Color color;
  final String image;
  final List<TypeEntity> pokemonType;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: const EdgeInsetsDirectional.only(bottom: 8),
      decoration: BoxDecoration(
        color: color.withAlpha(
          (0.2 * 255).toInt(),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$idº',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 21,
                      ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: pokemonType.map((pokemonType) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: PokemonType.values
                              .firstWhere(
                                (type) =>
                                    type.tag.name == pokemonType.type.name,
                              )
                              .tag
                              .color,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          PokemonType.values
                              .firstWhere(
                                (type) =>
                                    type.tag.name == pokemonType.type.name,
                              )
                              .tag
                              .icon,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(image),
                Icon(
                  icon,
                  size: 100,
                  color: Colors.white.withAlpha(
                    (0.2 * 255).toInt(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
