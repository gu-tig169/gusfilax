import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  bool _isChecked = false;

  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              new CheckboxListTile(
                title: Text("Click me"),
                value: _isChecked,
                activeColor: Colors.orange,
                onChanged: (bool value) {
                  onChanged(value);
                },
              ),
              new CheckboxListTile(
                title: Text("Click you"),
                value: _isChecked,
                activeColor: Colors.orange,
                onChanged: (bool value) {
                  onChanged(value);
                },
              )
            ],
          ),
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
  final TextEditingController controller = TextEditingController();

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
        title: Text("input Text"),
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
                    controller.text = "";
                  },
                  controller: controller),
              ListTile(
                title: Text(
                  result,
                ),
                trailing: Icon(
                  _isChecked ? Icons.add : Icons.add_box,
                  color: _isChecked ? Colors.red : null,
                ),
                // onTap: () {
                //   setState(() {
                //     _isChecked = value;
                //   });
                // }
              )
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
