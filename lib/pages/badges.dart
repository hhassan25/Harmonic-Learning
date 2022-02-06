import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:harmonic_learning/localization/localization_constants.dart';
import 'package:harmonic_learning/pages/evaluateProject.dart';
import 'package:http/http.dart' as http;

class Badges extends StatefulWidget {
  final String str;
  final String fileName;
  final String langCode;
  const Badges({Key key, this.str, this.fileName, this.langCode})
      : super(key: key);

  @override
  _BadgesState createState() => _BadgesState();
}

class _BadgesState extends State<Badges> {
  String b1 = "B1";
  String b2 = "B2";
  String b3 = "B3";
  String b4 = "B4";

  Future addBadge1() async {
    var url =
        Uri.parse('https://hadi.yallaproductionz.com/edugment/addBadge.php');
    var response = await http.post(url, body: {
      "username": '${widget.str}'.toString(),
      "fileName": '${widget.fileName}'.toString(),
      "badges": b1.toString()
    });
    var data = json.decode(response.body);
  }

  Future addBadge2() async {
    var url =
        Uri.parse('https://hadi.yallaproductionz.com/edugment/addBadge.php');
    var response = await http.post(url, body: {
      "username": '${widget.str}'.toString(),
      "fileName": '${widget.fileName}'.toString(),
      "badges": b2.toString()
    });
    var data = json.decode(response.body);
  }

  Future addBadge3() async {
    var url =
        Uri.parse('https://hadi.yallaproductionz.com/edugment/addBadge.php');
    var response = await http.post(url, body: {
      "username": '${widget.str}'.toString(),
      "fileName": '${widget.fileName}'.toString(),
      "badges": b3.toString()
    });
    var data = json.decode(response.body);
  }

  Future addBadge4() async {
    var url =
        Uri.parse('https://hadi.yallaproductionz.com/edugment/addBadge.php');
    var response = await http.post(url, body: {
      "username": '${widget.str}'.toString(),
      "fileName": '${widget.fileName}'.toString(),
      "badges": b4.toString()
    });
    var data = json.decode(response.body);
  }

  Future<bool> _onBackPressed() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => EvaluateProject(
                  str: '${widget.str}',
                  langCode: '${widget.langCode}',
                )));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text(getTranslated(context, 'badges')),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: ListView(
              children: [
                Column(
                  //scrollDirection: Axis.vertical,
                  children: [
                    Text(
                      "Student Name: " + '${widget.str}',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Alike',
                          color: Colors.blueAccent),
                    ),
                    Text(
                      "Project Name: " + '${widget.fileName}',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Alike',
                          color: Colors.blueAccent),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Text(
                        "Choose a badge",
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 20,
                            fontFamily: 'Alike',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        var alert = AlertDialog(
                          title: Center(
                              child: Text(
                            getTranslated(context, 'badges'),
                            style: TextStyle(
                                color: Colors.red, fontFamily: 'Quando'),
                          )),
                          content: Container(
                            height: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  color: Colors.black,
                                ),
                                Center(
                                    child: Text(
                                  "The badge " +
                                      "$b1" +
                                      " will be added to the student's profile",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontFamily: 'Alike',
                                      fontWeight: FontWeight.bold),
                                )),
                                SizedBox(
                                  height: 12,
                                ),
                                SizedBox(
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        RaisedButton(
                                          color: Color.fromARGB(
                                              255, 122, 255, 127),
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop('alert');
                                            addBadge1();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor:
                                                  Colors.green[900],
                                              content: Text(
                                                getTranslated(
                                                    context, 'markAdded'),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Alike'),
                                              ),
                                            ));
                                          },
                                          child: Text(
                                              getTranslated(context, 'yes'),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18,
                                                  fontFamily: 'Alike',
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        RaisedButton(
                                          color: Color.fromARGB(
                                              255, 122, 255, 127),
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop('alert');
                                          },
                                          child: Text(
                                              getTranslated(context, 'no'),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18,
                                                  fontFamily: 'Alike',
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
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
                      },
                      child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(100.0),
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.redAccent, blurRadius: 20)
                                ]),
                            child: ClipOval(
                              child: Image(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/B1.png"),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "$b1",
                      style: TextStyle(
                          color: Colors.indigoAccent,
                          fontSize: 18,
                          fontFamily: 'Quando',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Divider(
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        var alert = AlertDialog(
                          title: Center(
                              child: Text(
                            getTranslated(context, 'badges'),
                            style: TextStyle(
                                color: Colors.red, fontFamily: 'Quando'),
                          )),
                          content: Container(
                            height: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  color: Colors.black,
                                ),
                                Center(
                                    child: Text(
                                  "The badge " +
                                      "$b2" +
                                      " will be added to the student's profile",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontFamily: 'Alike',
                                      fontWeight: FontWeight.bold),
                                )),
                                SizedBox(
                                  height: 12,
                                ),
                                SizedBox(
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        RaisedButton(
                                          color: Color.fromARGB(
                                              255, 122, 255, 127),
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop('alert');
                                            addBadge2();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor:
                                                  Colors.green[900],
                                              content: Text(
                                                getTranslated(
                                                    context, 'markAdded'),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Alike'),
                                              ),
                                            ));
                                          },
                                          child: Text(
                                              getTranslated(context, 'yes'),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18,
                                                  fontFamily: 'Alike',
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        RaisedButton(
                                          color: Color.fromARGB(
                                              255, 122, 255, 127),
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop('alert');
                                          },
                                          child: Text(
                                              getTranslated(context, 'no'),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18,
                                                  fontFamily: 'Alike',
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
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
                      },
                      child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(100.0),
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.redAccent, blurRadius: 20)
                                ]),
                            child: ClipOval(
                              child: Image(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/B2.png"),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "$b2",
                      style: TextStyle(
                          color: Colors.indigoAccent,
                          fontSize: 18,
                          fontFamily: 'Quando',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Divider(
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        var alert = AlertDialog(
                          title: Center(
                              child: Text(
                            getTranslated(context, 'badges'),
                            style: TextStyle(
                                color: Colors.red, fontFamily: 'Quando'),
                          )),
                          content: Container(
                            height: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  color: Colors.black,
                                ),
                                Center(
                                    child: Text(
                                  "The badge " +
                                      "$b3" +
                                      " will be added to the student's profile",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontFamily: 'Alike',
                                      fontWeight: FontWeight.bold),
                                )),
                                SizedBox(
                                  height: 12,
                                ),
                                SizedBox(
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        RaisedButton(
                                          color: Color.fromARGB(
                                              255, 122, 255, 127),
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop('alert');
                                            addBadge3();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor:
                                                  Colors.green[900],
                                              content: Text(
                                                getTranslated(
                                                    context, 'markAdded'),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Alike'),
                                              ),
                                            ));
                                          },
                                          child: Text(
                                              getTranslated(context, 'yes'),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18,
                                                  fontFamily: 'Alike',
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        RaisedButton(
                                          color: Color.fromARGB(
                                              255, 122, 255, 127),
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop('alert');
                                          },
                                          child: Text(
                                              getTranslated(context, 'no'),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18,
                                                  fontFamily: 'Alike',
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
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
                      },
                      child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(100.0),
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.redAccent, blurRadius: 20)
                                ]),
                            child: ClipOval(
                              child: Image(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/B3.png"),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "$b3",
                      style: TextStyle(
                          color: Colors.indigoAccent,
                          fontSize: 18,
                          fontFamily: 'Quando',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Divider(
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        var alert = AlertDialog(
                          title: Center(
                              child: Text(
                            getTranslated(context, 'badges'),
                            style: TextStyle(
                                color: Colors.red, fontFamily: 'Quando'),
                          )),
                          content: Container(
                            height: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  color: Colors.black,
                                ),
                                Center(
                                    child: Text(
                                  "The badge " +
                                      "$b4" +
                                      " will be added to the student's profile",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontFamily: 'Alike',
                                      fontWeight: FontWeight.bold),
                                )),
                                SizedBox(
                                  height: 12,
                                ),
                                SizedBox(
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        RaisedButton(
                                          color: Color.fromARGB(
                                              255, 122, 255, 127),
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop('alert');
                                            addBadge4();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor:
                                                  Colors.green[900],
                                              content: Text(
                                                getTranslated(
                                                    context, 'markAdded'),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Alike'),
                                              ),
                                            ));
                                          },
                                          child: Text(
                                              getTranslated(context, 'yes'),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18,
                                                  fontFamily: 'Alike',
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        RaisedButton(
                                          color: Color.fromARGB(
                                              255, 122, 255, 127),
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop('alert');
                                          },
                                          child: Text(
                                              getTranslated(context, 'no'),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18,
                                                  fontFamily: 'Alike',
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
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
                      },
                      child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(100.0),
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.redAccent, blurRadius: 20)
                                ]),
                            child: ClipOval(
                              child: Image(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/B4.png"),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "$b4",
                      style: TextStyle(
                          color: Colors.indigoAccent,
                          fontSize: 18,
                          fontFamily: 'Quando',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
