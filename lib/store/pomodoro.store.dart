import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoIntervalo { TRABALHO, DESCANSO }

abstract class _PomodoroStore with Store {
  @observable
  bool iniciado = false;

  @observable
  int minutos = 2;

  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;

  @observable
  TipoIntervalo tipoIntevalo = TipoIntervalo.TRABALHO;

  Timer? cronometro;

  @action
  void iniciar() {
    iniciado = true;
    cronometro = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutos == 0 && segundos == 0) {
        _trocarTipoIntevalo();
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
    minutos = estaTrabalhando() ? tempoTrabalho : tempoDescanso;
    segundos = 0;
  }

  @action
  incrementarTempoTrabalho() {
    tempoTrabalho++;
    if (estaTrabalhando()) reiniciar();
  }

  @action
  decrementarTempoTrabalho() {
    if (tempoTrabalho > 0) {
      tempoTrabalho--;
    }
    if (estaTrabalhando()) reiniciar();
  }

  @action
  incrementarTempoDescanso() {
    tempoDescanso++;
    if (estaDescansando()) reiniciar();
  }

  @action
  decrementarTempoDescanso() {
    if (tempoDescanso > 0) {
      tempoDescanso--;
    }
    if (estaDescansando()) reiniciar();
  }

  bool estaTrabalhando() {
    return tipoIntevalo == TipoIntervalo.TRABALHO;
  }

  bool estaDescansando() {
    return tipoIntevalo == TipoIntervalo.DESCANSO;
  }

  void _trocarTipoIntevalo() {
    if (estaTrabalhando()) {
      tipoIntevalo = TipoIntervalo.DESCANSO;
      minutos = tempoDescanso;
    } else {
      tipoIntevalo = TipoIntervalo.TRABALHO;
      minutos = tempoTrabalho;
    }
    segundos = 0;
  }
}
