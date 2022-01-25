import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harmonic_learning/pages/teacherDashboard.dart';
import '../localization/localization_constants.dart';

class ViewLessonAdmin extends StatefulWidget {
  final String str;
  final String langCode;
  final String pdfUrl;
  const ViewLessonAdmin({Key key, this.str, this.langCode, this.pdfUrl})
      : super(key: key);

  @override
  _ViewLessonAdminState createState() => _ViewLessonAdminState();
}

class _ViewLessonAdminState extends State<ViewLessonAdmin> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL('${widget.pdfUrl}');
    setState(() => _isLoading = false);
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
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
            appBar: AppBar(
              title: Text(getTranslated(context, 'lesson')),
              centerTitle: true,
              backgroundColor: Colors.red[900],
            ),
            body: Center(
              child: _isLoading
                  ? Center(
                      child: SpinKitThreeBounce(
                      color: Colors.red,
                      size: 30,
                    ))
                  : PDFViewer(
                      document: document,
                    ),
            )));
  }
}
