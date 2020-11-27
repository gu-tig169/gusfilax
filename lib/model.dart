import 'package:flutter/material.dart';

import 'InternetTalker.dart';

String setCheck(bool myCheck) {
  // if(myCheck == false)
  // if (myCheck == false) return 'false';
  // if (myCheck == true) return 'true';
  // return 'false';
}

// String boolToString(bool myCheck) {
//   if (myCheck == false) return 'false';
//   if (myCheck == true) return 'true';
//   return 'false';
// }

// bool stringToBool(String done) {
//   if (done == true) return true;
//   if (done == false) return false;
//   return false;
// }

class ToDo {
  String myText;
  String myId;
  bool myCheck;

  ToDo({
    this.myText,
    this.myCheck = false,
    this.myId,
  });

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
      // 'done': item.myCheck,
      'done': setCheck(item.myCheck),
    };
  }

  static ToDo fromJson(Map<String, dynamic> json) {
    return ToDo(
      myText: json['title'],
      myId: json['id'],
      myCheck: json['done'],
      // myCheck: stringToBool(json['done']),
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
    // _list.add(item);
    // List<ToDo> list = await InternetTalker.addToDo(item);
    await InternetTalker.addToDo(item);
    await getList();
  }

  void removeItem(ToDo item) async {
    await InternetTalker.deleteToDo(item.myId);
    await getList();
  }

  void checkCheckbox(ToDo item) async {
    // var idx = list.indexOf(item);
    // list[idx].check();
    // notifyListeners();
    // item.check();

    await InternetTalker.updateToDo(
      item.myId,
      item,
    );
    await getList();
  }

  void addToDoFilter(ToDo item) {
    _toDoList.add(item);
    _doneList.remove(item);
    notifyListeners();
  }

  void addDoneFilter(ToDo item) {
    _doneList.add(item);
    _toDoList.remove(item);
    notifyListeners();
  }
}
