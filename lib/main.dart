import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ToDoListView.dart';
import 'package:axel_app/model.dart';

void main() {
  var state = MyState();
  state.getList();

  runApp(ChangeNotifierProvider(create: (context) => state, child: ToDoApp()));
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoListView(),
    );
  }
}
