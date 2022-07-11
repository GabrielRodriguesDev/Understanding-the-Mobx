import 'package:mobx/mobx.dart';

part 'contador.store.g.dart';

class ContadorStore = _ContadorStore with _$ContadorStore;

abstract class _ContadorStore with Store {
  //TODO - Usa o mixing "Store";
  //TODO - Como não é a partir dessa classe que vamos obter a reatividade, então deixamos ela como privade e abstrata para seguir um modelo.";
  @observable
  int contador = 0;

  void increment() {
    contador++;
  }
}
