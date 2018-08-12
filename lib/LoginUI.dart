import 'package:flutter/material.dart';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:urra/MainPageUI.dart';
import 'package:urra/servi%C3%A7os/StateContainer.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginUI createState() => new LoginUI();
}

class LoginUI extends State<LoginPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount =
        await googleSignIn.signIn().catchError((e) => print(e));
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: gSA.idToken,
        accessToken: gSA.accessToken);

    print("USER NAME : ${user.displayName}");
    return user;
  }

  void _signOut() {
    googleSignIn.signOut();
    print("User Signed out");
  }


  @override
  Widget build(BuildContext context) {

    final StateContainer container = StateContainer.of(context);

    return new Scaffold(
        backgroundColor: Color.fromRGBO(0, 153, 0, 1.0),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(50.0),
              child: new Image.asset(
                'images/urra.gif',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 230.0,
              height: 50.0,
              child: Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.white,
                  onPressed: () {
                    _signIn().then((user) {
                      container.fireBaseUser.user = user;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainPageUI()));
                    }).catchError((e) => print(e));
                    //
                  },
                  splashColor: Color.fromRGBO(0, 153, 0, 1.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Image.asset(
                          'images/google_logo_icon.png',
                          width: 40.0,
                        ),
                      ),
                      Text('Sign in with Google'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
