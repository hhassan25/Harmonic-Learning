import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harmonic_learning/classes/getAllLessons.dart';
import 'package:http/http.dart' as http;

class Lessons extends StatefulWidget {
  final String str;
  const Lessons({Key key, this.str}) : super(key: key);

  @override
  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose a Location'),
          centerTitle: true,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Text("change"),
        ));
  }
}
