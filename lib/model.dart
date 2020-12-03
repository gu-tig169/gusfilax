import 'package:flutter/material.dart';
import 'InternetTalker.dart';

class ToDo {
  String myText;
  String myId;
  bool myCheck;

  ToDo({
    this.myText,
    this.myCheck = false,
    this.myId,
  });

  void removeMyToDo() {}

  void check() {
    if (this.myCheck == false) {
      this.myCheck = true;
    } else {
      this.myCheck = false;
    }
  }

  static Map<String, dynamic> toJson(ToDo item) {
    return {
      'title': item.myText,
      'done': item.myCheck,
    };
  }

  static ToDo fromJson(Map<String, dynamic> json) {
    return ToDo(
      myText: json['title'],
      myId: json['id'],
      myCheck: json['done'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<ToDo> _list = [];

  List<ToDo> get list => _list;

  List<ToDo> _doneList = [];

  List<ToDo> get doneList => _doneList;

  List<ToDo> _toDoList = [];

  List<ToDo> get toDoList => _toDoList;

  Future getList() async {
    List<ToDo> list = await InternetTalker.getToDo();
    _list = list;
    notifyListeners();
  }

  void addToDo(ToDo item) async {
    await InternetTalker.addToDo(item);
    await getList();
  }

  void removeItem(ToDo item) async {
    await InternetTalker.deleteToDo(item.myId);
    await getList();
  }

  void checkCheckbox(ToDo item) async {
    item.check();
    await InternetTalker.updateToDo(item.myId, item);
    await getList();
  }
}
