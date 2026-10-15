import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const AppButton(this.text, {
    super.key,
    this.onPressed,
  });

@override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
            )
          )
        )
      ),
    );
  }
}