import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

import 'login.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool hasInternet = false;

  final color = Colors.red;
  final text = 'try again';

  void checkInternte() async {
    if (hasInternet = await InternetConnectionChecker().hasConnection)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    else {
      showSimpleNotification(
        Text(
          'No Internet Connection',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        background: color,
      );
      var alert = AlertDialog(
        title: Text("Connection Error"),
        content: Container(
          height: 145,
          child: Column(
            children: [
              Divider(
                color: Colors.black,
              ),
              Text(
                  "Unable to connect to internet, check your connection and try later."),
              SizedBox(
                height: 7,
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop('alert');
                    checkInternte();
                  },
                  child: Text(
                    "Try Again",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternte();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Expanded(
                flex: 3,
                child: Image(
                  image: AssetImage('assets/edugment.jpeg'),
                )),
            Expanded(
              flex: 3,
              child: SpinKitRing(
                color: Colors.red,
                size: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
