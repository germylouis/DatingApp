import 'package:datingapp/models/user.dart';
import 'package:datingapp/sceens/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool fbLoggedIn = false;
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseAuth _auth;
  AppUser myUser;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 48, 111, 1.0),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Icon(Icons.face),
            ),
          ),
          Expanded(
            flex: 5,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                  top: 35.0, left: 20.0, right: 20.0),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    // ignore: missing_return
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Please Type An Email!';
                                      }
                                    },
                                    onSaved: (input) => _email = input,
                                    decoration:
                                        InputDecoration(labelText: 'Email'),
                                  ),
                                  SizedBox(height: 20.0),
                                  TextFormField(
                                    // ignore: missing_return
                                    validator: (input) {
                                      if (input.length < 6) {
                                        return 'Your Password Must Be At Least 6 Characters!';
                                      }
                                    },
                                    onSaved: (input) => _password = input,
                                    decoration:
                                        InputDecoration(labelText: 'Password'),
                                    obscureText: true,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 50.0,
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.black,
                      color: Colors.white,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: signIn,
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Stack(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 50.0,
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              _signInFacebook();
                            },
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.black,
                              elevation: 7.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.facebookF,
                                    color: Colors.blue,
                                    size: 30.0,
                                  ),
                                  Text(
                                    ' |  Sign in with Facebook',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: InkWell(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Profile()));
      } catch (e) {
        print(e.message);
      }
    }
  }

  void _signInFacebook() async {
    FacebookLogin facebookLogin = FacebookLogin();
    _auth = FirebaseAuth.instance;

    final result = await facebookLogin.logIn(['email']);
    final token = result.accessToken.token;
    final graphResponse = await http.get(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name&access_token=$token');
    print(graphResponse.body);
    if (result.status == FacebookLoginStatus.loggedIn) {
      final credential = FacebookAuthProvider.credential(token);
      _auth.signInWithCredential(credential);
      fbLoggedIn = true;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Profile()));
    }
  }

  void setProfile() {
    // myUser.fName =
  }
}
