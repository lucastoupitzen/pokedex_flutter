import 'package:flutter/material.dart';
import 'package:pokeapp/pokemon.dart';
import 'package:pokeapp/widgets/bodyWidget.dart';

class PokeDetail extends StatelessWidget {

  final Pokemon pokemon;

 PokeDetail({required this.pokemon}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text(pokemon.name.toString()),
      ),
      body: BodyWidget(pokemon: pokemon),
    );
  }
}