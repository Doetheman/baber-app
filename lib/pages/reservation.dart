import 'package:flutter/material.dart';
import 'package:push/pages/home.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

Widget buildAvatarCircle() {
  return Container(
    height: 70.0,
    //color: Colors.black,
    child: Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.grey,
          maxRadius: 27.0,
        ),
      ],
    ),
  );
}

Widget buildHorizontalWeekBar() {
  return Container(
    height: 80.0,
    //color: Colors.black,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'Su',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  maxRadius: 20.0,
                  child: Text(
                    '12',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 80.0),
            Column(
              children: <Widget>[
                Text(
                  'M',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  maxRadius: 20.0,
                  child: Text(
                    '13',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 80.0),
            Column(
              children: <Widget>[
                Text(
                  'Tu',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  maxRadius: 20.0,
                  child: Text(
                    '14',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 80.0),
            Column(
              children: <Widget>[
                Text(
                  'W',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  maxRadius: 20.0,
                  child: Text(
                    '15',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 80.0),
            Column(
              children: <Widget>[
                Text(
                  'Th',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  maxRadius: 20.0,
                  child: Text(
                    '16',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 80.0),
            Column(
              children: <Widget>[
                Text(
                  'F',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  maxRadius: 20.0,
                  child: Text(
                    '17',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 80.0),
            Column(
              children: <Widget>[
                Text(
                  'Sa',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  maxRadius: 20.0,
                  child: Text(
                    '18',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildReservations(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    },
    child: Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[100]),
              color: Colors.grey[500]),
          height: 100.0,
          width: 100.0,
          //color: Colors.grey[500],
        ),
        SizedBox(width: 10.0),
        Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey[100])),
          height: 100.0,
          width: 278.0,
          //color: Colors.black,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Reservation',
                  style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '12 PM - 4 PM',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'OpenSans'),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Cuts n\' styles',
                  style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _ReservationPageState extends State<ReservationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          //Container for entire screen that will hold widgets
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                //padding for the container of the whole screen
                horizontal: 20.0,
                vertical: 80.0,
              ),
              child: Column(
                children: <Widget>[
                  //Wigets inside of column that will be placed onto screen
                  buildAvatarCircle(),
                  SizedBox(height: 40.0),
                  buildHorizontalWeekBar(),
                  Divider(),
                  SizedBox(height: 20.0),
                  buildReservations(context),
                ],
              ),
            ),
          ),
          //Container to hold the widgets I want to put on screen
        ],
      ),
    );
  }
}
