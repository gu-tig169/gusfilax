import 'package:flutter/material.dart';

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
  Map<String, bool> values = {
    "Ringa polisen": false,
    'Ringa tandläkare': false,
    'Tvätta kläder': false,
  };
  // var _value = false;

  // final tasks = [
  //   Task(title: "Köpa tröja"),
  //   Task(title: "Ringa tandläkare"),
  //   Task(title: "Köpa sylt")
  // ];

  // bool _isChecked = false;

  // void onChanged(bool value) {
  //   setState(() {
  //     _isChecked = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("ToDo"),
      ),

      // body: new Text("${widget.value}"),

      body: ListView(
        children: values.keys.map((String key) {
          return CheckboxListTile(
            title: Text(key),
            value: values[key],
            onChanged: (bool value) {
              setState(() {
                values[key] = value;
              });
            },
          );
        }).toList(),
      ),

      //   children: [
      //     CheckboxListTile(
      //       title: Text(tasks),
      //       value: _value,
      //       onChanged: (value) {
      //         setState(() {
      //           _value = value;
      //         });
      //       },
      //     )
      //   ],
      // ),
      // body: ListView.builder(
      //   itemCount: tasks.length,
      //   itemBuilder: (context, index) {
      //     final task = tasks[index];
      //     return ListTile(
      //       title: Text(task.title),
      //       trailing: Icon(Icons.check_box_outline_blank),
      //     );
      // },
      // ),
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

// class AddTaskPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Add task")),
//       body: Center(),
//     );
//   }
// }

class MyTextInput extends StatefulWidget {
  @override
  MyTextInputState createState() => MyTextInputState();
}

class MyTextInputState extends State<MyTextInput> {
  var _controller = TextEditingController();

  String result = "";

  bool _isChecked = false;

  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New task"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                  decoration: InputDecoration(hintText: "Type in here"),
                  onSubmitted: (String str) {
                    setState(() {
                      result = str;
                    });
                    _controller.text = "";
                  },
                  controller: _controller),

              ListTile(
                title: Text(
                  result,
                ),
                trailing: RaisedButton(
                    child: Icon(
                      Icons.add,
                    ),
                    onPressed: () {
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) => MyApp(value: result),
                      );
                      Navigator.of(context).push(route);
                    }),
              ),

              // railing: Icon(
              //   _isChecked ? Icons.add : Icons.add_box,
              //   color: _isChecked ? Colors.red : null,
              // ),

              // onTap: () {
              //   setState(() {
              //     _isChecked = value;
              //   });
              // }

              // Row(R
              //   children: [
              // Text(
              //   result,
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),

              // Checkbox(
              //   value: _isChecked,
              //   activeColor: Colors.orange,
              //   onChanged: (bool value) {
              //     onChanged(value);
              //   },
              // ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCheckbox extends StatefulWidget {
  @override
  CheckboxWidget createState() => new CheckboxWidget();
}

class CheckboxWidget extends State {
  bool isChecked = true;

  var checkedResult = 'Checkbox is CHECKED';

  void toggleCheckbox(bool value) {
    if (isChecked == false) {
      setState(() {
        isChecked = true;
        checkedResult = 'Checkbox is CHECKED';
      });
    } else {
      setState(() {
        isChecked = false;
        checkedResult = 'Checkbox is UN-CHECKED';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(
        scale: 1.5,
        child: Checkbox(
          value: isChecked,
          onChanged: (value) {
            toggleCheckbox(value);
          },
          activeColor: Colors.green,
          checkColor: Colors.white,
          tristate: false,
        ),
      ),
      Text(
        '$checkedResult',
        style: TextStyle(fontSize: 21),
        textAlign: TextAlign.center,
      )
    ]);
  }
}
