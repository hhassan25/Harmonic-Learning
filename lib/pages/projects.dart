// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harmonic_learning/classes/getUser.dart';
import 'package:harmonic_learning/localization/localization_constants.dart';
import '../classes/config.dart';
import '../classes/getAllLessons.dart';
import 'studentDashboard.dart';
import 'package:http/http.dart' as http;

class Projects extends StatefulWidget {
  final String str;
  final String langCode;
  const Projects({Key key, this.str, this.langCode}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  var fileUrl;
  bool fileChosen = false;
  bool fileUploaded = false;

  Future<List<GetUser>> getUser() async {
    String url =
        "https://hadi.yallaproductionz.com/edugment/getUser.php?username=" +
            '${widget.str}';
    final response = await http.get(url);
    return getUserFromJson(response.body);
  }

  Future addProjectToMain() async {
    var url = Uri.parse(
        'https://hadi.yallaproductionz.com/edugment/addFileToMainProjects.php');
    var response = await http.post(url, body: {
      "username": '${widget.str}'.toString(),
      "fileUrl": fileUrl.toString(),
      "fileName": fileUrl.toString()
    });

    var data = json.decode(response.body);
  }

  Future chooseFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
      setState(() {
        fileUrl = file.path;
      });
      print(fileUrl);
    } else {
      // User canceled the picker
    }
  }

  Future saveFile() async {
    var uri = Uri.parse(
        "https://hadi.yallaproductionz.com/edugment/saveFile.php?username=" +
            '${widget.str}');
    var request = http.MultipartRequest("POST", uri);
    var uploadVideo = await http.MultipartFile.fromPath("my_video", fileUrl);
    request.files.add(uploadVideo);
    var response = await request.send();
    if (response.statusCode == 200) {
      print(response.reasonPhrase);
    }
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
        appBar: AppBar(
          title: Text(getTranslated(context, 'uploadProject')),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FutureBuilder(
              future: getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        GetUser getUser = snapshot.data[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.0,
                            horizontal: 0.0,
                          ),
                          child: Column(children: [
                            Text(
                              getUser.username,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(getUser.classId,
                                style: TextStyle(color: Colors.white))
                          ]),
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
            RaisedButton(
              onPressed: () {
                chooseFile();
                fileChosen = true;
              },
              child: Text(getTranslated(context, 'chooseFile')),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              fileUrl != null
                  ? fileUrl
                  : getTranslated(context, 'noFileSelected'),
              style: TextStyle(color: Colors.black38),
            )),
            SizedBox(height: 5),
            RaisedButton(
              onPressed: () {
                if (fileChosen == false) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red[900],
                    content: Text(
                      getTranslated(context, 'chooseFileFirst'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Alike'),
                    ),
                  ));
                } else {
                  saveFile();
                  fileUploaded = true;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.blue[900],
                    content: Text(
                      getTranslated(context, 'fileUploaded'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Alike'),
                    ),
                  ));
                }
              },
              child: Text(getTranslated(context, 'uploadFile')),
            ),
            RaisedButton(
              onPressed: () {
                if (fileUploaded == true) {
                  var alert = AlertDialog(
                    title: Text(getTranslated(context, 'uploadFile')),
                    content: Container(
                      height: 130,
                      child: Column(
                        children: [
                          Divider(
                            color: Colors.black,
                          ),
                          Text(getTranslated(context, 'sureToUpload')),
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
                                      Navigator.of(context, rootNavigator: true)
                                          .pop('alert');
                                      addProjectToMain();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor: Colors.blue[900],
                                        content: Text(
                                          getTranslated(context, 'shareDone'),
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
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop('alert');
                                    },
                                    child: Text(
                                      getTranslated(context, 'no'),
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
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red[900],
                    content: Text(
                      getTranslated(context, 'uploadFirst'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Alike'),
                    ),
                  ));
                }
              },
              child: Text(getTranslated(context, 'shareFile')),
            )
          ],
        ),
      ),
    );
  }
}
