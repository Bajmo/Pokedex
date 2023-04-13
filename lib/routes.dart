import 'package:flutter/material.dart';
import 'package:pokedex/core/fade_page_route.dart';
import 'package:pokedex/ui/screens/pokedex/pokedex.dart';
import 'package:pokedex/ui/screens/pokemon_info/pokemon_info.dart';
import 'package:pokedex/ui/screens/splash/splash.dart';

enum Routes { splash, pokedex, pokemonInfo }

class _Paths {
  static const String splash = '/';
  static const String pokedex = '/pokedex';
  static const String pokemonInfo = '/pokemon';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.pokedex: _Paths.pokedex,
    Routes.pokemonInfo: _Paths.pokemonInfo,
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return FadeRoute(page: SplashScreen());

      case _Paths.pokemonInfo:
        return FadeRoute(page: PokemonInfo());

      case _Paths.pokedex:
      default:
        return FadeRoute(page: PokedexScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}
