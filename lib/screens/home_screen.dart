import 'package:flutter/material.dart';
import 'package:triplen_app/screens/main_screen.dart';
import 'package:triplen_app/screens/profile_screen.dart';
import 'package:triplen_app/utils/color_util.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screen = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.backgroundColor,
      body: SafeArea(
        top: true,
        child: screen == 1 ? MainScreen() : screen == 2 ? null : ProfileScreen(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorUtil.secondaryColor,
        onPressed: () {},
        elevation: 1,
        hoverElevation: 3,
        focusElevation: 3,
        highlightElevation: 3,
        splashColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color(0XFFD3D6DA).withAlpha(50), offset: Offset(0, -2), blurRadius: 1,
                spreadRadius: 1)
          ]
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    screen = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Icon(Icons.dashboard, color: screen == 1 ? ColorUtil.secondaryColor : ColorUtil.greyColor),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    screen = 2;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Icon(Icons.history, color: screen == 2 ? ColorUtil.secondaryColor : ColorUtil.greyColor,),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    screen = 3;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Icon(Icons.pages, color: screen == 3 ? ColorUtil.secondaryColor : ColorUtil.greyColor,),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    screen = 4;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Icon(Icons.account_circle, color: screen == 4 ? ColorUtil.secondaryColor : ColorUtil.greyColor,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}