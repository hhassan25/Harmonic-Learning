import 'package:flutter/material.dart';
import 'package:harmonic_learning/pages/evaluateProject.dart';

class SustainableDevelopment extends StatefulWidget {
  final String str;
  final String fileName;
  const SustainableDevelopment({Key key, this.fileName, this.str})
      : super(key: key);

  @override
  _SustainableDevelopmentState createState() => _SustainableDevelopmentState();
}

class _SustainableDevelopmentState extends State<SustainableDevelopment> {
  Future<bool> _onBackPressed() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => EvaluateProject(
                  str: '${widget.str}',
                  fileName: '${widget.fileName}',
                )));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Container(
        child: Image(
          image: AssetImage('assets/humanityGoals.png'),
        ),
      ),
    );
  }
}
