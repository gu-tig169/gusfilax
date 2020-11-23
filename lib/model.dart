import 'package:flutter/material.dart';

class ToDo {
  String myText;
  bool myCheck;

  ToDo({
    this.myText,
    this.myCheck = false,
  });

  void check() {
    if (this.myCheck == false) {
      this.myCheck = true;
    } else {
      this.myCheck = false;
    }
  }
}

class MyState extends ChangeNotifier {
  List<ToDo> _list = [];

  List<ToDo> get list => _list;

  List<ToDo> _doneList = [];

  List<ToDo> get doneList => _doneList;

  List<ToDo> _toDoList = [];

  List<ToDo> get toDoList => _toDoList;

  void addToDo(ToDo item) {
    _list.add(item);
    notifyListeners();
  }

  void removeItem(ToDo item) {
    _list.remove(item);
    _doneList.remove(item);
    _toDoList.remove(item);

    notifyListeners();
  }

  void addToDoFilter(ToDo item) {
    _toDoList.add(item);
    _doneList.remove(item);
    notifyListeners();
    print(_toDoList.length);
  }

  void addDoneFilter(ToDo item) {
    _doneList.add(item);
    _toDoList.remove(item);
    notifyListeners();
    print(_doneList.length);
  }

  void checkCheckbox(ToDo item) {
    var idx = list.indexOf(item);
    list[idx].check();
    notifyListeners();
  }
}
