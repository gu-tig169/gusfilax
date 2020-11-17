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
      leading: MyCheckbox(),
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

class MyCheckbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyCheckboxState();
  }
}

class MyCheckboxState extends State {
  var checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxValue,
      onChanged: (newValue) {
        setState(() {
          checkboxValue = newValue;
        });
      },
    );
  }
}
