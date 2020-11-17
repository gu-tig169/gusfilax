import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ToDoList.dart';
import 'model.dart';

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
        if (dropdownValue == 'ToDo') {
          print("ToDo");
        } else if (dropdownValue == 'Done') {
          print('Done');
        } else {
          print('All');
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
