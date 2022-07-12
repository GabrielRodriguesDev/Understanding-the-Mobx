// ignore_for_file: unnecessary_this, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {
  EntradaTempo({
    Key? key,
    required this.titulo,
    required this.valor,
    this.inc,
    this.dec,
  }) : super(key: key);

  final String titulo;
  final int valor;
  final void Function()? inc;
  final void Function()? dec;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Column(
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: this.dec,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(5),
                primary: store.estaFocado()
                    ? const Color.fromARGB(255, 225, 0, 113)
                    : Colors.indigo,
              ),
              child: const Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
            ),
            Text(
              '$valor min',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            ElevatedButton(
              onPressed: this.inc,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(5),
                primary: store.estaFocado()
                    ? const Color.fromARGB(255, 225, 0, 113)
                    : Colors.indigo,
              ),
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
