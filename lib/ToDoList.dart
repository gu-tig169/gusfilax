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
        value: item.myCheck,
        onChanged: (bool newVal) {
          var state = Provider.of<MyState>(context, listen: false);
          state.checkCheckbox(item);
          if (item.myCheck == false) {
            state.addToDoFilter(item);
          } else if (item.myCheck == true) {
            state.addDoneFilter(item);
          }
        },
      ),
      title: Text(item.myText),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          var state = Provider.of<MyState>(context, listen: false);
          state.removeItem(item);
        },
      ),
    );
  }
}
