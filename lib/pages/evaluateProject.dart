import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:harmonic_learning/localization/localization_constants.dart';
import 'package:harmonic_learning/pages/SustainableDevelopment.dart';
import 'package:http/http.dart' as http;

class EvaluateProject extends StatefulWidget {
  final String str;
  final String fileName;
  const EvaluateProject({Key key, this.str, this.fileName}) : super(key: key);

  @override
  _EvaluateProjectState createState() => _EvaluateProjectState();
}

class _EvaluateProjectState extends State<EvaluateProject> {
  int _scienceRadioValue = 0;
  int scienceResult = 0;
  Color scienceResultColor;

  int _technologyRadioValue = 0;
  int technologyResult = 0;
  Color technologyResultColor;

  int _engineerRadioValue = 0;
  int engineerResult = 0;
  Color engineerResultColor;

  int _artsRadioValue = 0;
  int artsResult = 0;
  Color artsResultColor;

  int _mathRadioValue = 0;
  int mathResult = 0;
  Color mathResultColor;

  int _productionRadioValue = 0;
  int productionResult = 0;
  Color productionResultColor;

  int _humanityRadioValue = 0;
  int humanityResult = 0;
  Color humanityResultColor;

  int total = 0;

  void _scienceChangeValue(int value) {
    setState(() {
      _scienceRadioValue = value;

      switch (_scienceRadioValue) {
        case 0:
          scienceResultColor = Colors.red;
          scienceResult = 0;
          break;

        case 50:
          scienceResultColor = Colors.blue;
          scienceResult = 50;
          break;

        case 100:
          scienceResultColor = Colors.green;
          scienceResult = 100;
          break;
      }
    });
  }

  void _technologyChangeValue(int value) {
    setState(() {
      _technologyRadioValue = value;

      switch (_technologyRadioValue) {
        case 0:
          technologyResultColor = Colors.red;
          technologyResult = 0;
          break;

        case 50:
          technologyResultColor = Colors.blue;
          technologyResult = 50;
          break;

        case 100:
          technologyResultColor = Colors.green;
          technologyResult = 100;
          break;
      }
    });
  }

  void _engineerChangeValue(int value) {
    setState(() {
      _engineerRadioValue = value;

      switch (_engineerRadioValue) {
        case 0:
          engineerResultColor = Colors.red;
          engineerResult = 0;
          break;

        case 50:
          engineerResultColor = Colors.blue;
          engineerResult = 50;
          break;

        case 100:
          engineerResultColor = Colors.green;
          engineerResult = 100;
          break;
      }
    });
  }

  void _artsChangeValue(int value) {
    setState(() {
      _artsRadioValue = value;

      switch (_artsRadioValue) {
        case 0:
          artsResultColor = Colors.red;
          artsResult = 0;
          break;

        case 50:
          artsResultColor = Colors.blue;
          artsResult = 50;
          break;

        case 100:
          artsResultColor = Colors.green;
          artsResult = 100;
          break;
      }
    });
  }

  void _mathChangeValue(int value) {
    setState(() {
      _mathRadioValue = value;

      switch (_mathRadioValue) {
        case 0:
          mathResultColor = Colors.red;
          mathResult = 0;
          break;

        case 50:
          mathResultColor = Colors.blue;
          mathResult = 50;
          break;

        case 100:
          mathResultColor = Colors.green;
          mathResult = 100;
          break;
      }
    });
  }

  void _productionChangeValue(int value) {
    setState(() {
      _productionRadioValue = value;

      switch (_productionRadioValue) {
        case 0:
          productionResultColor = Colors.red;
          productionResult = 0;
          break;

        case 100:
          productionResultColor = Colors.green;
          productionResult = 100;
          break;
      }
    });
  }

  void _humanityChangeValue(int value) {
    setState(() {
      _humanityRadioValue = value;

      switch (_humanityRadioValue) {
        case 0:
          humanityResultColor = Colors.red;
          humanityResult = 0;
          break;

        case 100:
          humanityResultColor = Colors.green;
          humanityResult = 100;
          break;
      }
    });
  }

  Future addMarks() async {
    var url =
        Uri.parse('https://hadi.yallaproductionz.com/edugment/addMarks.php');
    var response = await http.post(url, body: {
      "username": '${widget.str}'.toString(),
      "fileName": '${widget.fileName}'.toString(),
      "mark": total.toString()
    });

    var data = json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(getTranslated(context, 'evaluate')),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Image(image: AssetImage('assets/steamLogo.png')),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.black,
              ),
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
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      //width: MediaQuery.of(context).size.width - 30,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.greenAccent, blurRadius: 10)
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image(
                            image: AssetImage('assets/S.png'),
                          ),
                          Text(
                            "How much science is used in the project:",
                            style: TextStyle(
                                fontFamily: 'Quando',
                                fontSize: 14,
                                color: Colors.green),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 0,
                                groupValue: _scienceRadioValue,
                                onChanged: _scienceChangeValue,
                                activeColor: Colors.green,
                              ),
                              new Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 50,
                                groupValue: _scienceRadioValue,
                                onChanged: _scienceChangeValue,
                                activeColor: Colors.green,
                              ),
                              new Text(
                                "50",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 100,
                                groupValue: _scienceRadioValue,
                                onChanged: _scienceChangeValue,
                                activeColor: Colors.green,
                              ),
                              new Text(
                                "100",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Center(
                            child: Text(
                              "$scienceResult",
                              style: TextStyle(
                                  color: scienceResultColor,
                                  fontSize: 18,
                                  fontFamily: 'Satisfy'),
                            ),
                          )
                        ],
                      ),
                    ),

                    /*===============================================================*/
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width - 30,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.blueAccent, blurRadius: 10)
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image(
                            image: AssetImage('assets/T.png'),
                          ),
                          Text(
                            "How much Technology is used in the project:",
                            style: TextStyle(
                                fontFamily: 'Quando',
                                fontSize: 14,
                                color: Colors.blue),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 0,
                                groupValue: _technologyRadioValue,
                                onChanged: _technologyChangeValue,
                                activeColor: Colors.blue,
                              ),
                              new Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 50,
                                groupValue: _technologyRadioValue,
                                onChanged: _technologyChangeValue,
                                activeColor: Colors.blue,
                              ),
                              new Text(
                                "50",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 100,
                                groupValue: _technologyRadioValue,
                                onChanged: _technologyChangeValue,
                                activeColor: Colors.blue,
                              ),
                              new Text(
                                "100",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Center(
                            child: Text(
                              "$technologyResult",
                              style: TextStyle(
                                  color: technologyResultColor,
                                  fontSize: 18,
                                  fontFamily: 'Satisfy'),
                            ),
                          )
                        ],
                      ),
                    ),

                    /*===============================================================*/
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width - 30,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.orange, blurRadius: 10)
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image(
                            image: AssetImage('assets/E.png'),
                          ),
                          Text(
                            "How much Engineering is used in the project:",
                            style: TextStyle(
                                fontFamily: 'Quando',
                                fontSize: 14,
                                color: Colors.orange),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 0,
                                groupValue: _engineerRadioValue,
                                onChanged: _engineerChangeValue,
                                activeColor: Colors.orange,
                              ),
                              new Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 50,
                                groupValue: _engineerRadioValue,
                                onChanged: _engineerChangeValue,
                                activeColor: Colors.orange,
                              ),
                              new Text(
                                "50",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 100,
                                groupValue: _engineerRadioValue,
                                onChanged: _engineerChangeValue,
                                activeColor: Colors.orange,
                              ),
                              new Text(
                                "100",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Center(
                            child: Text(
                              "$engineerResult",
                              style: TextStyle(
                                  color: engineerResultColor,
                                  fontSize: 18,
                                  fontFamily: 'Satisfy'),
                            ),
                          )
                        ],
                      ),
                    ),

                    /*===============================================================*/
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width - 30,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.purple, blurRadius: 10)
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image(
                            image: AssetImage('assets/A.png'),
                          ),
                          Text(
                            "How much Arts is used in the project:",
                            style: TextStyle(
                                fontFamily: 'Quando',
                                fontSize: 14,
                                color: Colors.purple),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 0,
                                groupValue: _artsRadioValue,
                                onChanged: _artsChangeValue,
                                activeColor: Colors.purple,
                              ),
                              new Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 50,
                                groupValue: _artsRadioValue,
                                onChanged: _artsChangeValue,
                                activeColor: Colors.purple,
                              ),
                              new Text(
                                "50",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 100,
                                groupValue: _artsRadioValue,
                                onChanged: _artsChangeValue,
                                activeColor: Colors.purple,
                              ),
                              new Text(
                                "100",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Center(
                            child: Text(
                              "$artsResult",
                              style: TextStyle(
                                  color: artsResultColor,
                                  fontSize: 18,
                                  fontFamily: 'Satisfy'),
                            ),
                          )
                        ],
                      ),
                    ),

                    /*===============================================================*/
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width - 30,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.red, blurRadius: 10)
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image(
                            image: AssetImage('assets/M.png'),
                          ),
                          Text(
                            "How much Math is used in the project:",
                            style: TextStyle(
                                fontFamily: 'Quando',
                                fontSize: 14,
                                color: Colors.red),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 0,
                                groupValue: _mathRadioValue,
                                onChanged: _mathChangeValue,
                                activeColor: Colors.red,
                              ),
                              new Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 50,
                                groupValue: _mathRadioValue,
                                onChanged: _mathChangeValue,
                                activeColor: Colors.red,
                              ),
                              new Text(
                                "50",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 100,
                                groupValue: _mathRadioValue,
                                onChanged: _mathChangeValue,
                                activeColor: Colors.red,
                              ),
                              new Text(
                                "100",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Center(
                            child: Text(
                              "$mathResult",
                              style: TextStyle(
                                  color: mathResultColor,
                                  fontSize: 18,
                                  fontFamily: 'Satisfy'),
                            ),
                          )
                        ],
                      ),
                    ),

                    /*===============================================================*/
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width - 30,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.green, blurRadius: 10)
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image(
                            image: AssetImage('assets/Production.png'),
                          ),
                          Text(
                            "Is this project able to be producted:",
                            style: TextStyle(
                                fontFamily: 'Quando',
                                fontSize: 14,
                                color: Colors.green),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 0,
                                groupValue: _productionRadioValue,
                                onChanged: _productionChangeValue,
                                activeColor: Colors.green,
                              ),
                              new Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 100,
                                groupValue: _productionRadioValue,
                                onChanged: _productionChangeValue,
                                activeColor: Colors.green,
                              ),
                              new Text(
                                "100",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Center(
                            child: Text(
                              "$productionResult",
                              style: TextStyle(
                                  color: productionResultColor,
                                  fontSize: 18,
                                  fontFamily: 'Satisfy'),
                            ),
                          )
                        ],
                      ),
                    ),

                    /*===============================================================*/
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width - 30,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.green, blurRadius: 10)
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image(
                            image: AssetImage('assets/Humanity.png'),
                          ),
                          Text(
                            "Is this agrees at list 1 Sustainable Development able to be producted:",
                            style: TextStyle(
                                fontFamily: 'Quando',
                                fontSize: 14,
                                color: Colors.green),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 0,
                                groupValue: _humanityRadioValue,
                                onChanged: _humanityChangeValue,
                                activeColor: Colors.green,
                              ),
                              new Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Radio(
                                value: 100,
                                groupValue: _humanityRadioValue,
                                onChanged: _humanityChangeValue,
                                activeColor: Colors.green,
                              ),
                              new Text(
                                "100",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Alike'),
                              )
                            ],
                          ),
                          Center(
                            child: Text(
                              "$humanityResult",
                              style: TextStyle(
                                  color: humanityResultColor,
                                  fontSize: 18,
                                  fontFamily: 'Satisfy'),
                            ),
                          ),
                          Center(
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SustainableDevelopment(
                                              str: '${widget.str}',
                                              fileName: '${widget.fileName}',
                                            )));
                              },
                              child: Text(
                                "Click to see Sustainable Development",
                                style: TextStyle(fontFamily: 'Alike'),
                              ),
                            ),
                          ),
                          SizedBox(height: 10)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                            onPressed: () {
                              //_calculateTotal();

                              setState(() {
                                total = (scienceResult +
                                        technologyResult +
                                        engineerResult +
                                        artsResult +
                                        mathResult +
                                        productionResult +
                                        humanityResult) ~/
                                    7;
                              });
                              var alert = AlertDialog(
                                title: Center(
                                    child: Text(
                                  getTranslated(context, 'result'),
                                  style: TextStyle(
                                      color: Colors.red, fontFamily: 'Quando'),
                                )),
                                content: Container(
                                  height: 130,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Divider(
                                        color: Colors.black,
                                      ),
                                      Center(
                                          child: Text(
                                        "$total",
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
                                                MainAxisAlignment.center,
                                            children: [
                                              RaisedButton(
                                                color: Color.fromARGB(
                                                    255, 122, 255, 127),
                                                onPressed: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop('alert');

                                                  addMarks();

                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    backgroundColor:
                                                        Colors.green[900],
                                                    content: Text(
                                                      getTranslated(
                                                          context, 'markAdded'),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontFamily: 'Alike'),
                                                    ),
                                                  ));
                                                },
                                                child: Text(
                                                    getTranslated(
                                                        context, 'ok'),
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 18,
                                                        fontFamily: 'Alike',
                                                        fontWeight:
                                                            FontWeight.bold)),
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
                            child: Text(
                              "Calculate Mark",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Satisfy',
                                  color: Colors.redAccent),
                            )),
                        RaisedButton(
                            onPressed: () {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Divider(
                                        color: Colors.black,
                                      ),
                                      Center(
                                          child: Text(
                                        "$total",
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
                                                MainAxisAlignment.center,
                                            children: [
                                              RaisedButton(
                                                color: Color.fromARGB(
                                                    255, 122, 255, 127),
                                                onPressed: () {},
                                                child: Text(
                                                    getTranslated(
                                                        context, 'ok'),
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 18,
                                                        fontFamily: 'Alike',
                                                        fontWeight:
                                                            FontWeight.bold)),
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
                            child: Text(
                              "Give Badge",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Satisfy',
                                  color: Colors.redAccent),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
