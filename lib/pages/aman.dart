import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harmonic_learning/pages/studentDashboard.dart';

class Aman extends StatefulWidget {
  const Aman({Key key}) : super(key: key);

  @override
  _AmanState createState() => _AmanState();
}

class _AmanState extends State<Aman> {
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
        context, MaterialPageRoute(builder: (context) => studentDashboard()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          appBar: AppBar(
            title: Text("welcome"),
            backgroundColor: Colors.blue[900],
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
