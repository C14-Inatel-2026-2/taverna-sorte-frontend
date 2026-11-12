import 'package:flutter/material.dart';

class ItemPopup<T> extends PopupRoute<T> {

  final String title;
  final String description;

  ItemPopup({
    required this.title,
    required this.description,
  });

  @override
  Color? get barrierColor => Colors.black.withAlpha(0x50);
  
  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Popup para compra do item $title';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Center(
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyMedium!,
        child: UnconstrainedBox(
          child: Container(
            width: 300,
            padding: const .all(20.0),
            decoration: BoxDecoration(
              borderRadius: .circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                Text(description),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'Fechar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}