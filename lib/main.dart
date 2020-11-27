import 'package:axel_app/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ToDoListView.dart';

void main() {
  var state = MyState();
  state.getList();

  runApp(ChangeNotifierProvider(create: (context) => state, child: ToDoApp()));
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: ToDoListView(),
    );
  }
}
