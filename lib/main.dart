import 'package:flutter/material.dart';

class Todo {
  final String task;

  Todo(this.task);
}

void main() {
  runApp(MaterialApp(
    home: ToDoApp(),
  ));
}

class ToDoApp extends StatefulWidget {
  @override
  ToDoAppState createState() => new ToDoAppState();
}

class ToDoAppState extends State<ToDoApp> {
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
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.delete),
            title: Text("task1"),
            trailing: Icon(Icons.check_box_outline_blank),
          )
        ],
      ),
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
  String inputResult = "";

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
              onChanged: (String str) {
                inputResult = str;
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
                    print(inputResult);
                  },
                  label: Text("Add Todo"),
                )),
          ],
        ),
      ),
    );
  }
}
