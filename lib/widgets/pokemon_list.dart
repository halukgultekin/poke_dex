
import 'package:flutter/material.dart';
import 'package:flutter_poke_dex/model/pokemon_model.dart';
import 'package:flutter_poke_dex/services/pokedex_api.dart';
import 'package:flutter_poke_dex/widgets/pokelist_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonList extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
late Future<List<PokemonModel>> _pokemonListFuture;
@override
  void initState() {
    _pokemonListFuture = PokeApi.getPokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
        future: _pokemonListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel> _listem = snapshot.data!;

            return GridView.builder(itemCount: _listem.length,gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ScreenUtil().orientation == Orientation.portrait ? 2 : 3), itemBuilder: (contex,index) => PokeListItem(pokemon: _listem[index] ));
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Hata404'),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
  }
}

