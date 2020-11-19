import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyDropdownWidget.dart';
import 'ToDoInput.dart';
import 'ToDoList.dart';
import 'model.dart';

class ToDoListView extends StatelessWidget {
  // var hej = 1;
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("ToDo"),
        actions: [
          MyDropdownWidget(),
        ],
      ),
      body: myBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
        onPressed: () async {
          var newToDo = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ToDoInput(
                ToDo(
                  myText: '',
                ),
              ),
            ),
          );
          Provider.of<MyState>(context, listen: false).addToDo(newToDo);
          Provider.of<MyState>(context, listen: false).addToDoFilter(newToDo);
        },
      ),
    );
  }

  Widget myBody() {
    // if (hej == 1) {
    return Container(
      child: Consumer<MyState>(
        builder: (context, state, child) => ToDoList(state.list),
      ),
    );
    // } else if (hej == 2) {
    //   return Container(
    //     child: Consumer<MyState>(
    //       builder: (context, state, child) => ToDoList(state.doneList),
    //     ),
    //   );
    // } else {
    //   return Container(
    //     child: Consumer<MyState>(
    //       builder: (context, state, child) => ToDoList(state.toDoList),
    //     ),
    //   );
    // }
  }
}
