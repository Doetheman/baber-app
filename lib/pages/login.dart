// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:push/styleFunctions/style.dart';
import 'package:push/pages/signup.dart';

/*class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Email can't be empty";
    }
  }
}*/

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  String _email, _password;

  ///final _auth = FirebaseAuth.instance;
  AlertDialog alertDialog;
  //AuthenticationProvider authenticationProvider;

  Widget buildEmailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: pushLabelStyle,
        ),
        SizedBox(height: 15.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: pushBoxDecorationStyle,
          height: 60.0,
          child: TextField(
              //validator: EmailValidator.validate,
              //keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 15.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                hintText: 'Enter your Email',
                hintStyle: pushHintTextStyle,
              ),
              onChanged: (value) {
                setState(() {
                  _email = value
                      .trim(); //set _email to the value in password text field
                });
              }),
        ),
      ],
    );
  }

  Widget buildPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: pushLabelStyle,
        ),
        SizedBox(height: 15.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: pushBoxDecorationStyle,
          height: 60.0,
          child: TextField(
              //keyboardType: TextInputType.visiblePassword,
              obscureText: true, //hide password
              style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 15.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                hintText: 'Enter your Password',
                hintStyle: pushHintTextStyle,
              ),
              onChanged: (value) {
                setState(() {
                  _password = value
                      .trim(); //set _password to the value in password text field
                });
              }),
        ),
      ],
    );
  }

  Widget buildForgotPasswordTextButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed:
            null, //this will need to be changed to connect to the back end later
        child: Text('Forgot Password?', style: pushLabelStyle),
      ),
    );
  }

  Widget buildRememberMeCheckBox() {
    return Container(
        child: Row(children: <Widget>[
      Theme(
          data: ThemeData(unselectedWidgetColor: Colors.black),
          child: Checkbox(
            value: _rememberMe,
            checkColor: Colors.white,
            activeColor: Colors.black,
            onChanged: (value) {
              setState(() {
                _rememberMe = value;
              });
            },
          )),
      Text(
        'Remeber Me',
        style: pushLabelStyle,
      ),
    ]));
  }

  /*void signIn() async {
    final status =
        await FirebaseAuthHelper().login(email: _email, pass: _password);
    if (status == AuthResultStatus.successful) {
      // Navigate to success page
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    } else {
      final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
      // _showAlertDialog(errorMsg);
      print(errorMsg);
    }
  }*/

  Widget buildSignInButton() {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical:
                15.0), //symmetric places a 15 pixel space on both sides of my login button widget
        width: double.maxFinite,
        child: FloatingActionButton(
          //onPressed: () => print("Login Button Pressed"),
          onPressed: () {
            //signIn();
            print("Sign In Button");
          },
          elevation: 5.0,
          shape:
              //RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              BeveledRectangleBorder(borderRadius: BorderRadius.zero),
          child: Text(
            'SIGN IN',
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                fontFamily: 'OpenSans'),
          ),
          backgroundColor: Colors.blue,
        ));
  }

  Widget buildOrSignInWith() {
    return Column(children: <Widget>[
      Text(
        '- OR -',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 18.0),
      Text("Sign in with", style: pushLabelStyle),
    ]);
  }

  Widget buildSignInWithSocials(Function onTap, AssetImage image) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          image: DecorationImage(image: image),
        ),
      ),
    );
  }

  Widget buildNewUserSignUp() {
    return GestureDetector(
        //onTap: () => print('Sign Up'),
        onTap: () {
          //createNewUser();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SignupPage(), //go to the signup page when sign up is clicked
              ));
        },
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              )),
          TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ))
        ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
            title: Text('Welcome'),
            ),*/
        body: Stack(
      children: <Widget>[
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        Container(
            height: double.maxFinite,
            child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 80.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'PUSH',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.normal),
                    ),
                    //Sized Box allows for spacing
                    SizedBox(height: 30.0),
                    SizedBox(height: 30.0),
                    SizedBox(height: 30.0),
                    SizedBox(height: 30.0),
                    buildEmailTextField(),
                    SizedBox(height: 30.0),
                    buildPasswordTextField(),
                    buildForgotPasswordTextButton(),
                    buildRememberMeCheckBox(),
                    SizedBox(height: 30.0),
                    SizedBox(height: 30.0),
                    SizedBox(height: 30.0),
                    SizedBox(height: 30.0),
                    SizedBox(height: 30.0),
                    SizedBox(height: 30.0),
                    buildSignInButton(),
                    buildNewUserSignUp(),
                  ],
                )))
      ],
    ));
  }
}
