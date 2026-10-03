import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final VoidCallback? onPressed;
  final String icon;
  final String name;
  final int price;

  ItemCard({super.key, this.onPressed, required this.icon, required this.name, required this.price});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.icon,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                '🪙 ${widget.price}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ]
          )
        )
      ),
    );
  }
}