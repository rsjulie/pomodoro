import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometro_button.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro/store/pomodoro.store.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Expanded(
        child: Observer(
      builder: (_) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              store.estaTrabalhando()
                  ? 'Hora de trabalhar'
                  : 'Hora de descansar',
              style: const TextStyle(
                fontSize: 34,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 110,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!store.iniciado)
                    CronometroButton(
                      icon: Icons.play_arrow,
                      text: 'Iniciar',
                      click: store.iniciar,
                    ),
                  if (store.iniciado)
                    CronometroButton(
                        icon: Icons.stop, text: 'Parar', click: store.parar),
                  CronometroButton(
                    icon: Icons.refresh,
                    text: 'Reiniciar',
                    click: store.reiniciar,
                  ),
                ],
              ),
            ),
          ],
        ),
        color: store.estaTrabalhando() ? Colors.red : Colors.blue,
        height: 100,
      ),
    ));
  }
}
