import 'dart:convert';

import 'package:axel_app/model.dart';
import 'package:http/http.dart' as http;

// https://todoapp-api-vldfm.ondigitalocean.app/todos/:dd1f8eb4-bd02-4ec1-8b2c-007210b0750a?key=0716e1fa-636f-468b-8a39-aeaa58823aa2

const API =
    'https://todoapp-api-vldfm.ondigitalocean.app/todos?key=0716e1fa-636f-468b-8a39-aeaa58823aa2';

const API_KEY = "0716e1fa-636f-468b-8a39-aeaa58823aa2";
const API_URL = "https://todoapp-api-vldfm.ondigitalocean.app";

class InternetTalker {
  static Future addToDo(ToDo item) async {
    Map<String, dynamic> json = ToDo.toJson(item);
    var bodyString = jsonEncode(json);
    await http.post(
      '$API_URL/todos?key=$API_KEY',
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future updateToDo(String toDoId, ToDo item) async {
    // Map<String, dynamic> json = ToDo.toJson(item);
    // await http.put(
    //   '$API_URL/todos/:$toDoId?key=$API_KEY',
    //   body: jsonEncode(<String, dynamic>{"done": toDoCheck}),
    // );
  }

  static Future deleteToDo(String toDoId) async {
    await http.delete('$API_URL/todos/$toDoId?key=$API_KEY');
  }

  static Future<List<ToDo>> getToDo() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    String bodyString = response.body;
    var json = jsonDecode(bodyString);
    return json.map<ToDo>((data) {
      return ToDo.fromJson(data);
    }).toList();
  }
}
