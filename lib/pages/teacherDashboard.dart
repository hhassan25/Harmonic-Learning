import 'package:flutter/material.dart';

import 'aman.dart';
import 'lessons.dart';
import 'viewProject.dart';

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({Key key}) : super(key: key);

  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Dashboard'),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Aman()));
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
                    /*onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Lessons(str: '${widget.str}',)));
                    },*/
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
                              builder: (context) => ViewProject()));
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
    );
  }
}
