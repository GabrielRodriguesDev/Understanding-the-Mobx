// ignore_for_file: library_private_types_in_public_api, constant_identifier_names

import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoIntervalo { Foco, Descanso }

abstract class _PomodoroStore with Store {
  Timer? cronometro;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.Foco;

  @observable
  bool iniciado = false;

  @observable
  int minutos = 0;

  @observable
  int segundos = 0;

  @observable
  int tempoFoco = 2;

  @observable
  int tempoDescanso = 2;

  @action
  void iniciar() {
    iniciado = true;

    //! Timer.periodic -> Retorna uma função em callback que nesse contexto é executada a cada 1 segundo.
    cronometro = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (minutos == 0 && segundos == 0) {
        _trocarTipoIntervalo();
      } else if (segundos == 0) {
        segundos = 59;
        minutos--;
      } else {
        segundos--;
      }
    });
  }

  @action
  void parar() {
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void reiniciar() {
    parar();
    minutos = estaFocado() ? tempoFoco : tempoDescanso;
    segundos = 0;
  }

  @action
  void incrementarTempoFoco() {
    tempoFoco++;
    if (estaFocado()) {
      reiniciar();
    }
  }

  @action
  void decrementarTempoFoco() {
    if (tempoFoco > 0) {
      tempoFoco--;
    }
    if (estaFocado()) {
      reiniciar();
    }
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
    if (estaDescansando()) {
      reiniciar();
    }
  }

  @action
  void decrementarTempoDescanso() {
    if (tempoDescanso > 0) {
      tempoDescanso--;
    }
    if (estaDescansando()) {
      reiniciar();
    }
  }

  void _trocarTipoIntervalo() {
    if (estaFocado()) {
      tipoIntervalo = TipoIntervalo.Descanso;
      minutos = tempoDescanso;
    } else {
      tipoIntervalo = TipoIntervalo.Foco;
      minutos = tempoFoco;
    }
    segundos = 0;
  }

  bool estaFocado() {
    return tipoIntervalo == TipoIntervalo.Foco;
  }

  bool estaDescansando() {
    return tipoIntervalo == TipoIntervalo.Descanso;
  }
}
