import 'package:flutter/material.dart';
import 'model.dart';

class ToDoWidget extends StatelessWidget {
  final ToDo item;

  ToDoWidget(this.item);

  Widget build(BuildContext context) {
    return Container(
      height: 411,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(item.myText),
      ),
    );
  }
}
