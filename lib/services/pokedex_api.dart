import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_poke_dex/model/pokemon_model.dart';

class PokeApi {
  static const String _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _list = [];

    var result = await Dio().get(_url);
    var PokeList = jsonDecode(result.data)['pokemon'];

    if (PokeList is List) {
      _list = PokeList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }
    debugPrint(_list.first.toString());
    return _list;
  }
}
