import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ToDoList.dart';
import 'model.dart';

class RealToDoListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("ToDo"),
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => ToDoList(
            state.list.where((item) => item.myCheck == false).toList()),
      ),
    );
  }
}
