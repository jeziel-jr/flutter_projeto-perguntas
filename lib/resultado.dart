import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  const Resultado(this.pontuacao, this.reiniciarQuestionario, {super.key});

  String get fraseResultado {
    if (pontuacao < 13) {
      return 'Parabéns!';
    } else if (pontuacao < 20) {
      return 'Você é bom!';
    } else if (pontuacao < 35) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // padding
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        const SizedBox(height: 15),
        Resposta('Reiniciar', reiniciarQuestionario),
      ],
    );
  }
}
