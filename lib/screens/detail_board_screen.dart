import 'package:flutter/material.dart';
import 'package:triplen_app/utils/color_util.dart';
import 'package:triplen_app/utils/screen_util.dart';

class DetailBoardPage extends StatefulWidget {
  DetailBoardPage({Key key}) : super(key: key);

  @override
  _DetailBoardPageState createState() => _DetailBoardPageState();
}

class _DetailBoardPageState extends State<DetailBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.backgroundColor,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Container(
            width: ScreenUtil.screenWidthDp,
            height: ScreenUtil.screenHeightDp,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: 150,
                  width: ScreenUtil.screenWidthDp,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.arrow_back), onPressed: () {})
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Trip ke Bali", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}