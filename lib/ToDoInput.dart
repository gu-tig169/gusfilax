import 'package:axel_app/model.dart';
import 'package:flutter/material.dart';

class ToDoInput extends StatefulWidget {
  final ToDo item;

  ToDoInput(this.item);

  @override
  State<StatefulWidget> createState() {
    return ToDoInputState(item);
  }
}

class ToDoInputState extends State<ToDoInput> {
  String myText;

  TextEditingController textEditingController;

  ToDoInputState(ToDo item) {
    this.myText = item.myText;

    textEditingController = TextEditingController(text: item.myText);

    textEditingController.addListener(() {
      setState(() {
        myText = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Todo"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input ToDo',
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              minWidth: 2000.0,
              height: 50.0,
              buttonColor: Colors.deepOrange,
              child: RaisedButton.icon(
                icon: Icon(Icons.add, size: 28),
                onPressed: () {
                  if (this.myText != "") {
                    Navigator.pop(
                        context,
                        ToDo(
                          myText: myText,
                        ));
                  }
                },
                label: Text(
                  "Add ",
                  style: TextStyle(fontSize: 19.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
