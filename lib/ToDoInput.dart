import 'package:axel_app/model.dart';
import 'package:flutter/material.dart';
import 'ToDoWidget.dart';

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
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            ToDoWidget(ToDo(
              myText: this.myText,
            )),
            TextField(
              controller: textEditingController,
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
                  Navigator.pop(
                      context,
                      ToDo(
                        myText: myText,
                      ));
                },
                label: Text("Add Todo"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
