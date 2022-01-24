import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harmonic_learning/classes/getAllLessons.dart';
import 'package:harmonic_learning/localization/localization_constants.dart';
import 'package:harmonic_learning/pages/studentDashboard.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class Lessons extends StatefulWidget {
  final String str;
  final String langCode;
  const Lessons({Key key, this.str, this.langCode}) : super(key: key);

  @override
  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  Future<List<GetLesson>> fetchUsers() async {
    String url =
        "https://hadi.yallaproductionz.com/edugment/getPdf.php?username=" +
            '${widget.str}' +
            "&langCode=" +
            '${widget.langCode}';
    final response = await http.get(url);
    return getLessonFromJson(response.body);
  }

  Future<bool> _onBackPressed() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => studentDashboard(
                  str: '${widget.str}',
                  langCode: '${widget.langCode}',
                )));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
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
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.0,
                            horizontal: 0.0,
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Card(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
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
                                  Column(
                                    children: [Text(getLesson.courseName)],
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
                  color: Colors.redAccent,
                  size: 30,
                ));
              },
            ),
          )),
    );
  }
}
