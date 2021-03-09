//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:push/pages/shopOwner.dart';
import 'package:push/styleFunctions/style.dart';
import 'package:push/pages/stylist.dart';

class UserType extends StatefulWidget {
  @override
  _UserTypeState createState() => _UserTypeState();
}

Widget buildStylist(BuildContext context) {
  return Column(
    children: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Stylist()));
        },
        child: Container(
          //color: Colors.black,
          alignment: Alignment.center,
          height: 250.0,
          width: 250.0,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            //Now I am inside the the squares within a column
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.cut),
                color: Colors.grey[700],
                iconSize: 50.0,
                onPressed: null,
              ),
              SizedBox(height: 20.0),
              Text(
                'Stylist',
                style: pushSignUpTextStyle,
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Widget buildShopOwner(BuildContext context) {
  return Column(
    children: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ShopOwner()));
        },
        child: Container(
          //color: Colors.black,
          alignment: Alignment.center,
          height: 250.0,
          width: 250.0,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            //Now I am inside the squares within a column
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.location_city),
                color: Colors.grey[700],
                iconSize: 50.0,
                onPressed: null,
              ),
              Text('Shop Owner', style: pushSignUpTextStyle),
            ],
          ),
        ),
      )
    ],
  );
}

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Stack(
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
            //Container for what will display on the entire screen
            alignment: Alignment.topCenter,
            height: double.maxFinite,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Now I can start placing different widgets on screen
                  Text(
                    'I am a:',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Now I can add the different user types
                  SizedBox(height: 30.0),
                  SizedBox(height: 30.0),
                  buildStylist(context),
                  SizedBox(height: 30.0),
                  SizedBox(height: 30.0),
                  buildShopOwner(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
