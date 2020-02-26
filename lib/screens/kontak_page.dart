import 'package:flutter/material.dart';
import 'package:triplen_app/utils/color_util.dart';

class KontakKami extends StatelessWidget {
  KontakKami({Key key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
              color: ColorUtil.secondaryColor,
              child: Row(
                children: <Widget>[
//                  InkWell(
//                    child: IconButton(
//                        icon: Icon(Icons.arrow_back),
//                        color: Colors.white,
//                        onPressed: () => Navigator.pop(context)),
//                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}