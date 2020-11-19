import 'package:axel_app/DoneListView.dart';
import 'package:flutter/material.dart';

import 'RealToDoList.dart';
import 'ToDoInput.dart';

class MyDropdownWidget extends StatefulWidget {
  MyDropdownWidget({Key key}) : super(key: key);

  @override
  _MyDropdownWidgetState createState() => _MyDropdownWidgetState();
}

class _MyDropdownWidgetState extends State<MyDropdownWidget> {
  String dropdownValue = 'All';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      iconSize: 24.0,
      value: dropdownValue,
      dropdownColor: Colors.white,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
        if (dropdownValue == "Done") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoneListView(),
            ),
          );
          dropdownValue = "All";
        } else if (dropdownValue == "ToDo") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RealToDoListView(),
            ),
          );
          dropdownValue = "All";
        }
      },
      items: <String>[
        'All',
        'Done',
        'ToDo',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
        );
      }).toList(),
    );
  }
}
