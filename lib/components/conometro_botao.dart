import 'package:flutter/material.dart';

class ConometroBotao extends StatelessWidget {
  const ConometroBotao(
      {Key? key, required this.texto, required this.icone, this.click})
      : super(key: key);
  final String texto;
  final IconData icone;
  final void Function()? click;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.black),
      onPressed: click,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(icone),
          ),
          Text(
            texto,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
