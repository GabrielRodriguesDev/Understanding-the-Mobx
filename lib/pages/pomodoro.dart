// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pomodoro/components/conometro.dart';
import 'package:pomodoro/components/entrada_tempo.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: Conometro()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const EntradaTempo(titulo: 'Foco', valor: 45),
                const EntradaTempo(titulo: 'Descanso', valor: 15),
              ],
            ),
          )
        ],
      ),
    );
  }
}
