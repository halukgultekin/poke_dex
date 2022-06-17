import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_poke_dex/constants/ui_helper.dart';
import 'package:flutter_poke_dex/model/pokemon_model.dart';

class PokeImgAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImgAndBall({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'assets/images/pokeball.png';
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(pokeballImageUrl,
          width: UIHelper.calculatePokeImgAndBallSize(),
          height: UIHelper.calculatePokeImgAndBallSize(),
          fit: BoxFit.fitHeight,
          )),
        Align(
          alignment: Alignment.bottomRight,
          child: CachedNetworkImage(imageUrl: pokemon.img ?? '',
           width: UIHelper.calculatePokeImgAndBallSize(),
           height: UIHelper.calculatePokeImgAndBallSize(),
           errorWidget: (context, url, error) => const Icon(Icons.access_alarm),
           fit: BoxFit.fitHeight,
           placeholder: (context, url) => const CircularProgressIndicator( color : Colors.red),
           
          ),
        )
      ],
    );
  }
}
