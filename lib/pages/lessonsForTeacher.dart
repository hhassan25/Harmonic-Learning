import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harmonic_learning/pages/teacherDashboard.dart';
import 'package:harmonic_learning/pages/viewLessonForTeacher.dart';
import 'package:http/http.dart' as http;
import '../classes/getAllLessons.dart';
import '../localization/localization_constants.dart';

class LessonsAdmin extends StatefulWidget {
  final String str;
  final String langCode;
  const LessonsAdmin({Key key, this.str, this.langCode}) : super(key: key);

  @override
  _LessonsAdminState createState() => _LessonsAdminState();
}

class _LessonsAdminState extends State<LessonsAdmin> {
  Future<List<GetLesson>> fetchUsers() async {
    String url =
        "https://hadi.yallaproductionz.com/edugment/getPdfToTeacher.php?langCode=" +
            '${widget.langCode}';
    final response = await http.get(url);
    return getLessonFromJson(response.body);
  }

  Future<bool> _onBackPressed() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => TeacherDashboard(
                  str: '${widget.str}',
                  langCode: '${widget.langCode}',
                )));
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.red[900],
            title: Text(getTranslated(context, 'myLessons')),
            centerTitle: true,
            elevation: 0.0,
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: FutureBuilder(
              future: fetchUsers(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        GetLesson getLesson = snapshot.data[index];
                        Color backColor = getLesson.isDemo == '0'
                            ? Colors.grey
                            : Color.fromARGB(255, 255, 255, 255);
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.0,
                            horizontal: 0.0,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              if ('${getLesson.isDemo}' == '0') {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewLessonAdmin(
                                              str: '${widget.str}',
                                              pdfUrl: '${getLesson.urll}',
                                            )));
                              } else {
                                var alert = AlertDialog(
                                  title:
                                      Text(getTranslated(context, 'warning')),
                                  content: Container(
                                    height: 130,
                                    child: Column(
                                      children: [
                                        Divider(
                                          color: Colors.black,
                                        ),
                                        Text(getTranslated(
                                            context, 'appIsDemo')),
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
                                                  onPressed: () {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop('alert');
                                                  },
                                                  child: Text(
                                                    getTranslated(
                                                        context, 'ok'),
                                                    textAlign: TextAlign.center,
                                                  ),
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
                              }
                            },
                            child: Card(
                              color: backColor,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: backColor,
                                    radius: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: CachedNetworkImage(
                                        imageUrl: getLesson.courseImage,
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(children: [
                                      Column(
                                        children: [
                                          Text(
                                            getLesson.courseName,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
                return Center(
                    child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 30,
                ));
              },
            ),
          )),
    );
  }
}
