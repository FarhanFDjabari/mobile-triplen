import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triplen_app/bloc/login/bloc.dart';
import 'package:triplen_app/screens/home_screen.dart';
import 'package:triplen_app/screens/slider_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LoginBloc loginBloc = LoginBloc();
  void timer() async {
    const _current = Duration(seconds: 2);
    Timer(_current, () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => SliderScreen()
        )
    ));
  }

  @override
  void initState() {
    loginBloc.dispatch(PrepareLoginEvent());
    // TODO: implement initState
    super.initState();
//    timer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: loginBloc,
      listener: (context, state) {
        if (state is NextToHomePageState) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (Route<dynamic> route) => false);
        } else {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SliderScreen()), (Route<dynamic>
          route) => false);
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
