import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/conometro_botao.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Conometro extends StatelessWidget {
  const Conometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(
      builder: (context) => Container(
        color: store.estaFocado()
            ? const Color.fromARGB(255, 225, 0, 113)
            : Colors.indigo,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              store.estaFocado() ? 'Hora de focar' : 'Hora de descansar',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 80, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!store.iniciado)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConometroBotao(
                        texto: 'Iniciar',
                        icone: Icons.play_arrow,
                        click: store.iniciar),
                  ),
                if (store.iniciado)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConometroBotao(
                      texto: 'Parar',
                      icone: Icons.stop,
                      click: store.parar,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConometroBotao(
                    texto: 'Reiniciar',
                    icone: Icons.refresh,
                    click: store.reiniciar,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
