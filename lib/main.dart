import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'pergunta': 'Qual sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 8},
        {'texto': 'Rosa', 'pontuacao': 7},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Azul', 'pontuacao': 10}
      ],
    },
    {
      'pergunta': 'Qual seu animal favorito?',
      'resposta': [
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 7},
        {'texto': 'Papagaio', 'pontuacao': 3},
        {'texto': 'Coelho', 'pontuacao': 5}
      ],
    },
    {
      'pergunta': 'Qual seu instrutor favorito?',
      'resposta': [
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Maria', 'pontuacao': 8},
        {'texto': 'Junior', 'pontuacao': 10},
        {'texto': 'Pedro', 'pontuacao': 2}
      ],
    },
    {
      'pergunta': 'Qual seu time favorito?',
      'resposta': [
        {'texto': 'Palmeiras', 'pontuacao': 5},
        {'texto': 'Corinthians', 'pontuacao': 4},
        {'texto': 'São Paulo', 'pontuacao': 10},
        {'texto': 'Santos', 'pontuacao': 2}
      ],
    },
    {
      'pergunta': 'Qual sua comida favorita?',
      'resposta': [
        {'texto': 'Lasanha', 'pontuacao': 8},
        {'texto': 'Pizza', 'pontuacao': 10},
        {'texto': 'Hambúrguer', 'pontuacao': 6},
        {'texto': 'Macarrão', 'pontuacao': 3}
      ],
    },
    {
      'pergunta': 'Qual seu esporte favorito?',
      'resposta': [
        {'texto': 'Natação', 'pontuacao': 10},
        {'texto': 'Vôlei', 'pontuacao': 8},
        {'texto': 'Tênis', 'pontuacao': 1},
        {'texto': 'Futebol', 'pontuacao': 6}
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
          backgroundColor: Colors.purple[900],
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
