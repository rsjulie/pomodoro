import 'package:flutter/material.dart';
import 'package:pomodoro/components/cronometro_button.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hora de trabalhar',
              style: TextStyle(
                fontSize: 34,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '25:00',
              style: TextStyle(
                fontSize: 110,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CronometroButton(icon: Icons.play_arrow, text: 'Iniciar'),
                // CronometroButton(icon: Icons.stop, text: 'Parar'),
                CronometroButton(icon: Icons.refresh, text: 'Reiniciar'),
              ],
            ),
          ],
        ),
        color: Colors.red,
        height: 100,
      ),
    );
  }
}
