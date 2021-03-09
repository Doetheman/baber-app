import 'package:flutter/material.dart';
import 'package:push/pages/reservation.dart';
import 'package:push/styleFunctions/style.dart';

class FeePage extends StatefulWidget {
  @override
  _FeePageState createState() => _FeePageState();
}

Widget buildStylistTitleBar(BuildContext context) {
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        alignment: Alignment.topCenter,
        height: 70.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.zero,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.cut),
              color: Colors.grey[200],
              iconSize: 40.0,
              onPressed: null,
            ),
            Text(
              'Stylist',
              style: pushStylistTitleStyle,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildText() {
  return Container(
    height: 200.0,
    width: 400.0,
    color: Colors.white,
    child: Center(
      child: Text(
        'There are 3 types of fee stuctures that a shop may use. Take a look at the following types to ensure you understand how many shops may be compensated.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget buildFixed() {
  return GestureDetector(
    onTap: () {},
    child: Row(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
        ),
        SizedBox(width: 20.0),
        Container(
          height: 100.0,
          width: 260.0,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'FIXED',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pay a set rate determined by the shop',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Example: \$20 per day',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 11.3,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildCommission() {
  return GestureDetector(
    onTap: () {},
    child: Row(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
        ),
        SizedBox(width: 20.0),
        Container(
          height: 100.0,
          width: 260.0,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'COMMISSION',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pay a set percentage of revenue to the shop owner',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Example: 70/30 split for every transaction',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 11.3,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildFixedPlusCommission() {
  return GestureDetector(
    onTap: () {},
    child: Row(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
        ),
        SizedBox(width: 20.0),
        Container(
          height: 100.0,
          width: 260.0,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'FIXED + COMMISSION',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pay a set minimum payment that increase with sales',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Example: \$100 per week + 5% for every transaction',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 11.3,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildStartStylingButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ReservationPage()));
    },
    child: Container(
      height: 50.0,
      width: double.maxFinite,
      decoration: pushBoxDecorationStyle,
      child: Center(
        child: Text(
          'Start Styling',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ),
  );
}

class _FeePageState extends State<FeePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar:AppBar(), //only to naviagte back eaily. I will comment out once I get more of the app setup
      body: Stack(
        //allows me to stack widgets on top of each other like the widgets i want to see on top of the main page
        children: <Widget>[
          Container(
            //Container for the entire screen
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          Container(
            //Container ontop of container for entire screen, and it will display all the widgets I want
            alignment: Alignment.topCenter,
            height: double.maxFinite,
            child: SingleChildScrollView(
              //physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  //I had to place these widgets in this contianer because the title needed differnt padding fro the rest
                  horizontal: 20.0,
                  vertical: 80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Now I can start placing differnt widgets in the container that will display all the widgets I need
                  buildStylistTitleBar(context),
                  SizedBox(height: 10.0),
                  buildText(),
                  SizedBox(height: 10.0),
                  buildFixed(),
                  SizedBox(height: 30.0),
                  buildCommission(),
                  SizedBox(height: 30.0),
                  buildFixedPlusCommission(),
                  SizedBox(height: 50.0),
                  buildStartStylingButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
