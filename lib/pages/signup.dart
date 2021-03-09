// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:push/styleFunctions/style.dart';
import 'package:push/pages/login.dart';
import 'package:push/pages/userType.dart';

/*class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Email can't be empty";
    }
  }
}*/

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _rememberMe = false;
  String _email, _password, _confirmPassword;
  //final _auth = FirebaseAuth.instance;
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
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black, fontFamily: 'OpenSans'),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 15.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                hintText: 'New Account Email',
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
                hintText: 'New Account Password',
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

  Widget buildConfirmPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /*Text(
          'Password',
          style: pushLabelStyle,
        ),*/
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
                hintText: 'Confirm New Password',
                hintStyle: pushHintTextStyle,
              ),
              onChanged: (value) {
                setState(() {
                  _confirmPassword = value.trim();
                });
              }),
        ),
      ],
    );
  }

  /*void createNewUser() async {
    if (_password == _confirmPassword) {//before creating an account check to see if the passwords match
      final status = await FirebaseAuthHelper()
          .createAccount(email: _email, pass: _password);
      if (status == AuthResultStatus.successful) {
        // Navigate to success page
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      } else {
        final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
        print(errorMsg);
      }
    } else {
      print('Passwords Do not Match');
    }
  }*/

  Widget buildSignUpButton() {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical:
                15.0), //symmetric places a 15 pixel space on both sides of my login button widget
        width: double.maxFinite,
        child: FloatingActionButton(
          //onPressed: () => print("Login Button Pressed"),
          onPressed: () {
            //signIn();
            print(
                "Sign Up"); //I will actually sign in when i add backend functions, but for now I want the routes set up
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => UserType()));
            //createNewUser();
          },
          elevation: 5.0,
          shape:
              //RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              BeveledRectangleBorder(borderRadius: BorderRadius.zero),
          child: Text(
            'CREATE ACCOUNT',
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
      Text("Sign up with", style: pushLabelStyle),
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

  Widget buildAlreadyHaveAccount() {
    return GestureDetector(
        //onTap: () => print('Sign Up'),
        onTap: () {
          //createNewUser();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    LoginPage(), //go back to the login page when already have an account is clicked
              ));
        },
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'Already have an Account? ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              )),
          TextSpan(
              text: 'Sign In',
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
            //title: Text('Welcome'),
            ),*/
        body: Stack(
      //allows me to stack widgets ontop of widgets
      children: <Widget>[
        Container(
          //entire screen
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
                    buildEmailTextField(),
                    SizedBox(height: 30.0),
                    buildPasswordTextField(),
                    SizedBox(height: 30.0),
                    buildConfirmPasswordTextField(),
                    SizedBox(height: 30.0),
                    //buildForgotPasswordTextButton(),
                    //buildRememberMeCheckBox(),
                    SizedBox(height: 30.0),
                    SizedBox(height: 30.0),
                    SizedBox(height: 30.0),
                    SizedBox(height: 30.0),
                    SizedBox(height: 30.0),
                    SizedBox(height: 22.5),
                    buildSignUpButton(),
                    buildAlreadyHaveAccount(),
                    //buildNewUserSignUp(),
                  ],
                )))
      ],
    ));
  }
}
