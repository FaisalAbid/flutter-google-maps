import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Maps Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Maps Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful,
  // meaning that it has a State object (defined below) that contains
  // fields that affect how it looks.

  // This class is the configuration for the state. It holds the
  // values (in this case the title) provided by the parent (in this
  // case the App widget) and used by the build method of the State.
  // Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const MethodChannel methodChannel = const MethodChannel('com.faisalabid/maps');
  void _launchMaps() {
    methodChannel.invokeMethod('launchMaps', {"lat": 37.4219999, "long": -122.0840575});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Center(
          child: new Text(
            'Tap Floating Button to launch maps',
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _launchMaps,
          tooltip: 'Launch Maps',
          child: new Icon(Icons.map),
        ));
  }
}
