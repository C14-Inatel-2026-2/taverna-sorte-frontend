import 'package:flutter/material.dart';

class CoinDisplay extends StatefulWidget {
  int value;
  CoinDisplay(this.value, {
    super.key,
  });

  @override
  State<CoinDisplay> createState() => _CoinDisplayState();
}

class _CoinDisplayState extends State<CoinDisplay> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('🪙 '),
        Text(widget.value.toString()),
      ],
    );
  }
}