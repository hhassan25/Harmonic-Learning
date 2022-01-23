import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int ninjaLevel = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey[800],
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[600],
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Hadi',
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alike'),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Grade',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '$ninjaLevel',
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alike'),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.person,
                  color: Colors.grey[400],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'account Type',
                  style: TextStyle(color: Colors.grey[400], letterSpacing: 2.0),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'student',
              style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alike'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ninjaLevel += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
    );
  }
}
