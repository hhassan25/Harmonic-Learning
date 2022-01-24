import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harmonic_learning/pages/studentDashboard.dart';

import '../localization/localization_constants.dart';
import 'lessons.dart';

class viewLesson extends StatefulWidget {
  final String str;
  final String pdfurl;
  final String langCode;

  const viewLesson({Key key, this.str, this.pdfurl, this.langCode})
      : super(key: key);

  @override
  _viewLessonState createState() => _viewLessonState();
}

class _viewLessonState extends State<viewLesson> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL('${widget.pdfurl}');
    setState(() => _isLoading = false);
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
              title: Text(getTranslated(context, 'lesson')),
              centerTitle: true,
              backgroundColor: Colors.blue[900],
            ),
            body: Center(
              child: _isLoading
                  ? Center(
                      child: SpinKitThreeBounce(
                      color: Colors.blue,
                      size: 30,
                    ))
                  : PDFViewer(
                      document: document,
                    ),
            )));
  }
}
