import 'package:flutter/material.dart';
import 'package:push/styleFunctions/style.dart';
import 'package:push/pages/fee.dart';
import 'package:push/pages/userType.dart';

class Stylist extends StatefulWidget {
  @override
  _StylistState createState() => _StylistState();
}

var _currentSelectedValue = '';

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

Widget buildFullNameTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: 30.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: pushBoxDecorationStyle,
        height: 50.0,
        child: TextField(
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
            fontSize: 20.0,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 15.0),
            hintText: 'Full Name',
            hintStyle: pushHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

Widget buildPrimaryLocationTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: 30.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: pushBoxDecorationStyle,
        height: 50.0,
        child: TextField(
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
            fontSize: 20.0,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.location_pin,
              color: Colors.grey[900],
            ),
            contentPadding: EdgeInsets.only(top: 15.0),
            hintText: 'Primary Location',
            hintStyle: pushHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

Widget buildWaiverTF() {
  var _itemList = ["A", "B", "C", "D"];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: 30.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: pushBoxDecorationStyle,
        height: 50.0,
        child: FormField<String>(builder: (FormFieldState<String> state) {
          return InputDecorator(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 15.0),
                hintText: 'Wavier',
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontFamily: 'OpenSans',
                  fontSize: 20.0,
                ),
              ),
              isEmpty: _currentSelectedValue == '',
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                value: _currentSelectedValue,
                isDense: true,
                onChanged: (String newValue) {
                  //I dont know why setState doesnt work
                  /*setState(() {
                    _currentSelectedValue = newValue;
                    state.didChange(newValue);
                  });*/
                },
                //This breaks my wavier textfield for some reason
                /*items: _itemList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),*/
              )));
        }),
      ),
    ],
  );
}

//void setState(Null Function() param0) {} //connected to the setState in the above method

Widget buildSpecialaltiesList() {
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
  ];
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100,
  ];
  return Container(
      height: 300.0,
      child: ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ));
}

Widget buildContinueButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FeePage()));
    },
    child: Container(
      height: 50.0,
      width: double.maxFinite,
      decoration: pushBoxDecorationStyle,
      child: Center(
        child: Text(
          'Continue',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
            fontSize: 30.0,
          ),
        ),
      ),
    ),
  );
}

class _StylistState extends State<Stylist> {
  @override
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
                  SizedBox(height: 20.0),
                  buildFullNameTF(),
                  SizedBox(height: 10.0),
                  buildPrimaryLocationTF(),
                  SizedBox(height: 10.0),
                  buildWaiverTF(),
                  SizedBox(height: 30.0),
                  Text(
                    'Select the specialities that apply',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                    ),
                    //textAlign: TextAlign.left,
                  ),
                  buildSpecialaltiesList(),
                  SizedBox(height: 60.0),
                  buildContinueButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
