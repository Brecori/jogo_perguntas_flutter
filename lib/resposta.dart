import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Define um padding de 8 pixels em todas as direções
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          onPressed: quandoSelecionado,
          child: Text(texto),
        ),
      ),
    );
  }
}
