import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta(this.texto, this.function, {super.key});
  final String texto;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      // max width
      child: ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple[900]),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          child: Text(texto)),
    );
  }
}
