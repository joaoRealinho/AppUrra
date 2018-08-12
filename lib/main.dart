import 'package:flutter/material.dart';
import 'package:urra/LoginUI.dart';
import 'package:urra/servi%C3%A7os/StateContainer.dart';
import 'package:urra/serviços/FireBaseUser.dart';

void main() => runApp(StateContainer(child: new MyApp()));


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new LoginPage()
    );
  }
}



