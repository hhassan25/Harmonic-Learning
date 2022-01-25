import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harmonic_learning/pages/teacherDashboard.dart';

class AmanAdmin extends StatefulWidget {
  final String str;
  final String langCode;
  const AmanAdmin({Key key, this.str, this.langCode}) : super(key: key);

  @override
  _AmanAdminState createState() => _AmanAdminState();
}

class _AmanAdminState extends State<AmanAdmin> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(
        'https://hadi.yallaproductionz.com/edugment/Internet_Safety_Booklet.pdf');
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
            title: Text("welcome"),
            backgroundColor: Colors.red[900],
            centerTitle: true,
          ),
          body: Center(
            child: _isLoading
                ? Center(
                    child: SpinKitThreeBounce(
                    color: Colors.redAccent,
                    size: 30,
                  ))
                : PDFViewer(
                    document: document,
                  ),
          )),
    );
  }
}
