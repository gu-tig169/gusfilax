// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }

// class MyApp extends StatefulWidget {
//   @override
//   MyAppState createState() => new MyAppState();
// }

// class MyAppState extends State<MyApp> {
//   bool _isChecked = false;

//   void onChanged(bool value) {
//     setState(() {
//       _isChecked = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(
//         title: Text("ToDo"),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(32.0),
//         child: Center(
//           child: Column(
//             children: [
//               new CheckboxListTile(
//                 title: Text("Click me"),
//                 value: _isChecked,
//                 activeColor: Colors.orange,
//                 onChanged: (bool value) {
//                   onChanged(value);
//                 },
//               ),
//               new CheckboxListTile(
//                 title: Text("Click you"),
//                 value: _isChecked,
//                 activeColor: Colors.orange,
//                 onChanged: (bool value) {
//                   onChanged(value);
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddTaskPage(),
//             ),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class AddTaskPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Add task")),
//       body: Center(),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ToDoPage(),
//     );
//   }
// }

// class ToDoPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Todo")),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddTaskPage(),
//             ),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class AddTaskPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Add task")),
//       body: Center(),
//     );
//   }
// }
