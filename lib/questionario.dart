import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    super.key,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  dynamic respostas() => (temPerguntaSelecionada
      ? perguntas[perguntaSelecionada]['resposta'] as List<Map<String, Object>>
      : null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['pergunta'] as String),
        ...respostas().map((resp) {
          return Resposta(
              resp['texto'], () => quandoResponder(resp['pontuacao']));
        }).toList(),
      ],
    );
  }
}
