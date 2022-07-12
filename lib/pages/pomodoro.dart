// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/conometro.dart';
import 'package:pomodoro/components/entrada_tempo.dart';
import 'package:provider/provider.dart';

import '../store/pomodoro.store.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: Conometro()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EntradaTempo(
                    titulo: 'Foco',
                    valor: store.tempoFoco,
                    inc: store.iniciado && store.estaFocado()
                        ? null
                        : store.incrementarTempoFoco,
                    dec: store.iniciado && store.estaFocado()
                        ? null
                        : store.decrementarTempoFoco,
                  ),
                  EntradaTempo(
                    titulo: 'Descanso',
                    valor: store.tempoDescanso,
                    inc: store.iniciado && store.estaDescansando()
                        ? null
                        : store.incrementarTempoDescanso,
                    dec: store.iniciado && store.estaDescansando()
                        ? null
                        : store.decrementarTempoDescanso,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
