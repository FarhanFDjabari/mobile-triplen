import 'dart:async';

import 'package:flutter/material.dart';
import 'package:triplen_app/screens/slider_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void timer() async {
    const _current = Duration(seconds: 2);
    Timer(_current, () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => intro()
        )
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/logo-triplen.png',
                scale: 1.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
