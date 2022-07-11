import 'package:flutter/material.dart';
import 'package:pomodoro/components/conometro_botao.dart';

class Conometro extends StatelessWidget {
  const Conometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Hora de Focar',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            '25:00',
            style: TextStyle(fontSize: 80, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child:
                    ConometroBotao(texto: 'Iniciar', icone: Icons.play_arrow),
              ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: ConometroBotao(texto: 'Parar', icone: Icons.stop),
              // ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ConometroBotao(texto: 'Reiniciar', icone: Icons.refresh),
              ),
            ],
          )
        ],
      ),
    );
  }
}
