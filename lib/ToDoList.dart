import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class ToDoList extends StatelessWidget {
  final List<ToDo> list;

  ToDoList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((item) => _toDoItem(context, item)).toList());
  }

  Widget _toDoItem(context, item) {
    return ListTile(
      leading: Checkbox(
        activeColor: Colors.deepOrange,
        value: item.myCheck,
        onChanged: (bool newVal) {
          var state = Provider.of<MyState>(context, listen: false);
          state.checkCheckbox(item);
        },
      ),
      title: Text(item.myText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.5)),
      trailing: IconButton(
        highlightColor: Colors.deepOrange,
        icon: Icon(Icons.delete, size: 28),
        onPressed: () {
          var state = Provider.of<MyState>(context, listen: false);
          state.removeItem(item);
        },
      ),
    );
  }
}
