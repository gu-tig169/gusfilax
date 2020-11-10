import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ToDoApp(),
  ));
}

class ToDoApp extends StatefulWidget {
  String value;
  ToDoApp({this.value});

  @override
  ToDoAppState createState() => new ToDoAppState(value);
}

class ToDoAppState extends State<ToDoApp> {
  var checkBoxValue = false;
  var checkBoxValue_2 = false;

  String value;
  ToDoAppState(this.value);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("ToDo"),
        actions: [
          MyDropdownWidget(),
        ],
      ),
      body: _item(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ToDoInput()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _item() {
    return Row(
      children: [
        Checkbox(
            value: checkBoxValue,
            onChanged: (bool value) {
              setState(() {
                checkBoxValue = value;
              });
            }),
        Expanded(
          child: value == null
              ? Text("")
              : Text(
                  value,
                ),
        ),
        Expanded(
            child: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {},
        )),
      ],
    );
  }
}

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

class ToDoInput extends StatefulWidget {
  @override
  ToDoInputState createState() => ToDoInputState();
}

class ToDoInputState extends State<ToDoInput> {
  // List<String> values = ["köpa sylt", "köpa honung"];
  String value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Todo"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                value = text;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input ToDo',
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
                minWidth: 380.0,
                height: 50.0,
                buttonColor: Colors.deepOrange,
                child: RaisedButton.icon(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ToDoApp(value: value),
                      ),
                    );
                    print(value);
                  },
                  label: Text("Add Todo"),
                )),
          ],
        ),
      ),
    );
  }
}
