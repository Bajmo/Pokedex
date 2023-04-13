import 'dart:convert';

import 'package:pokedex/core/network.dart';
import 'package:pokedex/data/source/github/models/pokemon.dart';

class GithubDataSource {
  GithubDataSource(this.networkManager);

  static const String url =
      'https://gist.githubusercontent.com/Bajmo/2bf95624ef71c2d91b6938b81549b5b1/raw/11369e94ca36a9235cc452e606ca62e5d040fff1/pokemons.json';

  final NetworkManager networkManager;

  Future<List<GithubPokemonModel>> getPokemons() async {
    final response = await networkManager.request(RequestMethod.get, url);

    final data = (json.decode(response.data) as List)
        .map((item) => GithubPokemonModel.fromJson(item))
        .toList();

    return data;
  }
}
