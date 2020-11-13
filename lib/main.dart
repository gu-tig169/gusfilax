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
      body: _toDoList(),
      // _iconRow(true, value),

      // _iconRow(true, value),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Navigator.push(
            // async()
            context,
            MaterialPageRoute(builder: (context) => ToDoInput()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _toDoList() {
    return ListView(
      children: [
        _iconRow(false, "Öva programmering"),
        _iconRow(true, "Diska"),
        _iconRow(true, "Köpa damsugarpåsar"),
      ],
    );
  }

  Widget _iconRow(checkBoxValue, text) {
    return Row(
      children: [
        Checkbox(
          value: checkBoxValue,
          onChanged: (asdlk) {},
        ),
        Expanded(
          child: Text(text),
          // value == null ? Text("") : Text(text),
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
                      // value
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
