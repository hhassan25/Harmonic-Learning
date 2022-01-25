import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harmonic_learning/classes/getProject.dart';
import 'package:harmonic_learning/localization/localization_constants.dart';
import 'package:harmonic_learning/pages/evaluateProject.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'teacherDashboard.dart';

class ViewProject extends StatefulWidget {
  final String str;
  final String langCode;
  const ViewProject({Key key, this.str, this.langCode}) : super(key: key);

  @override
  _ViewProjectState createState() => _ViewProjectState();
}

class _ViewProjectState extends State<ViewProject> {
  Future<List<GetProject>> fetchProjects() async {
    String url = "https://hadi.yallaproductionz.com/edugment/getProjects.php";
    final response = await http.get(url);
    return getProjectFromJson(response.body);
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
    fetchProjects();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text(getTranslated(context, 'projects')),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: FutureBuilder(
          future: fetchProjects(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    GetProject getProject = snapshot.data[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 8.0,
                      ),
                      child: Card(
                        color: Color.fromARGB(255, 218, 218, 218),
                        child: MaterialButton(
                          onPressed: () {
                            var alert = AlertDialog(
                              title: Text(
                                  getTranslated(context, 'projectDetails')),
                              content: Container(
                                height: 130,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Text("Student Name : " +
                                        getProject.fullname),
                                    Text("Project Title : " +
                                        getProject.fileName),
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
                                              onPressed: () async {
                                                /*Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop('alert');*/
                                                String url =
                                                    'https://hadi.yallaproductionz.com/edugment/' +
                                                        '${getProject.fileUrl}';

                                                if (await canLaunch(url)) {
                                                  await launch(url);
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    backgroundColor:
                                                        Colors.red[900],
                                                    content: Text(
                                                      getTranslated(
                                                          context, 'urlError'),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontFamily: 'Alike'),
                                                    ),
                                                  ));
                                                }
                                              },
                                              child: Text(
                                                getTranslated(
                                                    context, 'openProject'),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop('alert');
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EvaluateProject(
                                                              str: getProject
                                                                  .username,
                                                              fileName:
                                                                  getProject
                                                                      .fileName,
                                                            )));
                                              },
                                              child: Text(
                                                getTranslated(
                                                    context, 'evaluate'),
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
                          },
                          child: Column(
                            children: [
                              Text(
                                getProject.fileName,
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            return Center(
                child: SpinKitThreeBounce(
              color: Colors.blue,
              size: 30,
            ));
          },
        ),
      ),
    );
  }
}
