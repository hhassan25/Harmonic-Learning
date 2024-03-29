import 'package:flutter/material.dart';
import 'package:harmonic_learning/localization/localization_constants.dart';
import 'package:harmonic_learning/pages/profile.dart';
import 'package:harmonic_learning/pages/projects.dart';
import 'aman.dart';
import 'lessons.dart';
import 'login.dart';

class studentDashboard extends StatefulWidget {
  final String str;
  final String langCode;

  const studentDashboard({Key key, this.str, this.langCode}) : super(key: key);

  @override
  _studentDashboardState createState() => _studentDashboardState();
}

class _studentDashboardState extends State<studentDashboard> {
  Future<bool> _onBackPressed() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text(getTranslated(context, 'dashboard')),
          centerTitle: true,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(
                                str: '${widget.str}',
                                langCode: '${widget.langCode}',
                              )));
                },
                icon: Icon(Icons.person_rounded))
          ],
        ),
        body: Container(
          color: Colors.white70,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Aman(
                                      str: '${widget.str}',
                                      langCode: '${widget.langCode}',
                                    )));
                      },
                      child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(0.0),
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blueAccent, blurRadius: 20)
                                ]),
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/HeroesLogo.jpeg"),
                            ),
                          )),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Lessons(
                                      str: '${widget.str}',
                                      langCode: '${widget.langCode}',
                                    )));
                      },
                      child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(100.0),
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blueAccent, blurRadius: 20)
                                ]),
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/lessons.png"),
                            ),
                          )),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Projects(
                                      str: '${widget.str}',
                                      langCode: '${widget.langCode}',
                                    )));
                      },
                      child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(0.0),
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blueAccent, blurRadius: 20)
                                ]),
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/project.png"),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
