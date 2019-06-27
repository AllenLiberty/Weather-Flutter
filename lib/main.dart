import 'package:flutter/material.dart';
import 'package:flutter_app/LayoutTest.dart';
import 'package:flutter_app/FlutterRouter.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        "new_page":(context)=>NewRoute()
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) : super(key:key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int _counter = 0;
  void _incrementCounter(){
    getHttp();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title ?? 'ff'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text('open new page'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.of(context).pushNamed(
                    "new_page",
                    arguments: "titittiti");
              },
            )
          ],
        ),
      ),
      floatingActionButton: new IconButton(
          icon: new Icon(Icons.add),
          onPressed: _incrementCounter),
    );
  }
}