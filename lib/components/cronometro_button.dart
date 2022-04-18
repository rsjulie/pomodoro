import 'package:flutter/material.dart';

class CronometroButton extends StatelessWidget {
  final String text;
  final IconData icon;
  const CronometroButton({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.white,
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(icon),
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
