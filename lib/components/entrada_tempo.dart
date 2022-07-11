import 'package:flutter/material.dart';

class EntradaTempo extends StatelessWidget {
  const EntradaTempo({
    Key? key,
    required this.titulo,
    required this.valor,
  }) : super(key: key);

  final String titulo;
  final int valor;

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(5),
                  primary: Colors.indigo),
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(5),
                  primary: Colors.indigo),
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
