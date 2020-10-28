import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'hej'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 100;

  void _incrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Axel FIlipsson', style: TextStyle(fontSize: 30)),
            Text('counter',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.w200,
                  color: Colors.blue.withOpacity(0.8),
                )),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 200,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.remove),
      ),
      drawer: Drawer(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Axel FIlipsson', style: TextStyle(fontSize: 20)),
          Text('Axel FIlipsson', style: TextStyle(fontSize: 20)),
          Text('Axel FIlipsson', style: TextStyle(fontSize: 20)),
          Text('Axel FIlipsson', style: TextStyle(fontSize: 20)),
          Text('Axel FIlipsson', style: TextStyle(fontSize: 20)),
          Text('Axel FIlipsson', style: TextStyle(fontSize: 20)),
        ],
      )),
    );
  }
}
