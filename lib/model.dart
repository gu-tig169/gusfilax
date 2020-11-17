import 'package:flutter/material.dart';
import 'ToDoList.dart';

class ToDo {
  String myText;

  ToDo({
    this.myText,
  });
}

class MyState extends ChangeNotifier {
  List<ToDo> _list = [];

  List<ToDo> get list => _list;

  void addToDo(ToDo item) {
    _list.add(item);
    notifyListeners();
  }

  void removeItem(ToDo item) {
    _list.remove(item);

    notifyListeners();
  }

  void displayDone() {}
}
