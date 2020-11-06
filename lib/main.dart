import 'package:flutter/material.dart';
import 'dart:async';
import 'package:meta/meta.dart';

class Terminal {
  final String id;

  Terminal({
    this.id,
  });
}

class Task {
  final String title;

  Task({this.title});
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      accentColor: Colors.deepOrange,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  final String value;

  MyApp({Key key, this.value}) : super(key: key);

  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  var values = Expanded(flex: 1, child: MyTerminal());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("ToDo"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Sort",
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
            ),
            ListTile(
              title: Text("All"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Completed"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Uncompleted"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 1, child: MyTerminal()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyTextInput(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyTextInput extends StatefulWidget {
  @override
  MyTextInputState createState() => MyTextInputState();
}

class MyTextInputState extends State<MyTextInput> {
  String textInput;

  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Todo"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Input text',
                ),
                onChanged: (val) {
                  textInput = val;
                },
              ),
              FlatButton(
                padding: EdgeInsets.all(10.0),
                textColor: Colors.white,
                child: Text('Done', style: TextStyle(fontSize: 10.0)),
                color: Colors.deepOrange,
                onPressed: () {
                  events.add(Terminal(
                    id: textInput,
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTerminal extends StatefulWidget {
  @override
  _MyTerminalState createState() => _MyTerminalState();
}

StreamController<Terminal> events = StreamController<Terminal>();

final myController = TextEditingController();

class _MyTerminalState extends State<MyTerminal> {
  final notifications = [
    NotificationSetting(title: "Köp socker"),
    NotificationSetting(title: "Tvätta golvet")
  ];

  final List<Terminal> terminalNodes = [];

  initState() {
    events.stream.listen((data) {
      terminalNodes.add(data);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: terminalNodes.map((node) {
            return Column(
              children: [
                ...notifications.map(buildSingleCheckboxListTile).toList(),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildSingleCheckboxListTile(NotificationSetting notification) =>
      buildCheckboxListTile(
        notification: notification,
        onClicked: () {
          setState(() {
            final newValue = !notification.value;
            notification.value = newValue;
          });
        },
      );

  Widget buildCheckboxListTile({
    @required NotificationSetting notification,
    @required VoidCallback onClicked,
  }) =>
      ListTile(
        onTap: onClicked,
        leading: Checkbox(
          value: notification.value,
          onChanged: (value) => onClicked(),
        ),
        title: Text(notification.title),
        trailing: Icon(Icons.delete),
      );
}

class NotificationSetting {
  String title;
  bool value;

  NotificationSetting({
    @required this.title,
    this.value = false,
  });
}
