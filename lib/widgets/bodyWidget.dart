import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:pokeapp/pokemon.dart';
import 'package:pokeapp/pokemondetail.dart';

class BodyWidget extends StatelessWidget {
  final Pokemon pokemon;

  BodyWidget({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      pokemon.name.toString(),
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text("Height: ${pokemon.height.toString()}"),
                    Text("Weight: ${pokemon.weight.toString()}"),
                    Text("Types"),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: pokemon.type.isNull
                            ? []
                            : pokemon.type!
                                .map((e) => FilterChip(
                                    label: Text(e.toString()),
                                    onSelected: (b) {},
                                    backgroundColor: Colors.amber))
                                .toList()),
                    Text("Weakness"),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: pokemon.weaknesses.isNull
                            ? []
                            : pokemon.weaknesses!
                                .map((e) => FilterChip(
                                    label: Text(e.toString()),
                                    onSelected: (b) {},
                                    backgroundColor: const Color.fromARGB(
                                        255, 247, 129, 121)))
                                .toList()),
                    Text("Next Evolution"),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: pokemon.nextEvolution.isNull
                            ? []
                            : pokemon.nextEvolution!
                                .map((e) => FilterChip(
                                    label: Text(e.name.toString()),
                                    onSelected: (b) {},
                                    backgroundColor: Colors.green))
                                .toList()),
                  ]),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: pokemon.img.toString(),
            child: Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(pokemon.img.toString()),
                      fit: BoxFit.cover)),
            ),
          ),
        )
      ],
    );
  }
}
