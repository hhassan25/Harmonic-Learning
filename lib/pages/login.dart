import 'dart:convert';
import 'package:harmonic_learning/localization/localization_constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import '../classes/languages.dart';
import '../main.dart';
import 'studentDashboard.dart';
import 'teacherDashboard.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void _changeLanguage(Language language) {
    Locale _temp;
    switch (language.languageCode) {
      case 'en':
        _temp = Locale(language.languageCode, 'US');
        break;

      case 'ar':
        _temp = Locale(language.languageCode, 'SA');
        break;
      default:
        _temp = Locale(language.languageCode, 'US');
    }

    MyApp.setLocale(context, _temp);
  }

  Future login() async {
    var url = Uri.parse('https://hadi.yallaproductionz.com/edugment/login.php');
    var response = await http.post(url, body: {
      "username": username.text,
      "password": password.text,
    });

    var data = json.decode(response.body);

    if (data == "loginToStudent") {
      if (getTranslated(context, 'langCode') == 'en') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => studentDashboard(
                      str: username.text,
                      langCode: 'en',
                    )));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => studentDashboard(
                      str: username.text,
                      langCode: 'ar',
                    )));
      }
    } else if (data == "loginToTeacher") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TeacherDashboard()));
    } else {
      showSimpleNotification(
        Text(
          getTranslated(context, 'filluserpass'),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        background: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(getTranslated(context, 'login')),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: DropdownButton(
                onChanged: (Language language) {
                  _changeLanguage(language);
                },
                underline: SizedBox(),
                icon: Icon(Icons.language, color: Colors.white),
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                          value: lang,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                lang.flag,
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Image(
                  image: AssetImage('assets/logo.jpeg'),
                ),
              ),
              Expanded(
                flex: 5,
                child: ListView(scrollDirection: Axis.vertical, children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 30,
                            height: 55,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.blue, blurRadius: 10)
                                ]),
                            child: TextFormField(
                              controller: username,
                              cursorColor: Colors.blue,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                ),
                                hintText: getTranslated(context, 'username'),
                                hintStyle: TextStyle(
                                    color: Colors.black45,
                                    fontFamily: 'Quando'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 30,
                            height: 55,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.blue, blurRadius: 10)
                                ]),
                            child: TextFormField(
                              controller: password,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.security,
                                    color: Colors.blue,
                                  ),
                                  hintText: getTranslated(context, 'password'),
                                  hintStyle: TextStyle(
                                      color: Colors.black45,
                                      fontFamily: 'Quando')),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        RaisedButton(
                          color: Colors.lightGreen,
                          child: Text(
                            getTranslated(context, 'login'),
                            style: TextStyle(
                                fontFamily: 'Alike',
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            if (username.text == "" && password.text == "") {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red[900],
                                content: Text(
                                  getTranslated(context, 'filluserpass'),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Alike'),
                                ),
                              ));
                            } else {
                              login();
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
        ));
  }
}
