import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;

  @action
  incrementarTempoTrabalho() {
    tempoTrabalho++;
  }

  @action
  decrementarTempoTrabalho() {
    tempoTrabalho--;
  }

  @action
  incrementarTempoDescanso() {
    tempoDescanso++;
  }

  @action
  decrementarTempoDescanso() {
    tempoDescanso--;
  }
}
