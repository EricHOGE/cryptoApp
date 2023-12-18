import 'package:flutter/material.dart';

class PriceUpWidget extends StatelessWidget {
  const PriceUpWidget({Key? key, required this.cryptoChange}) : super(key: key);
  final num cryptoChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 73, 199, 79),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        '+${cryptoChange.toStringAsFixed(1)}%',
        style: const TextStyle(fontWeight: FontWeight.w500),
        textAlign: TextAlign.end,
      ),
    );
  }
}
