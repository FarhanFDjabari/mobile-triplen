import 'package:flutter/material.dart';
import 'package:triplen_app/utils/color_util.dart';

import 'detail_news_page.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "News",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset('assets/logo-light.png'),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.only(top: 15),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        width: 50,
                        height: 100,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0XFFD3D6DA).withAlpha(50),
                                  offset: Offset(0, 1),
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ],
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Container(
                                width: 15.0,
                                height: 15.0,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Icon(Icons.image),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Tempat Wisata Malam di Jogja $index",
                                    style: TextStyle(
                                        color: ColorUtil.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                Text("08/02/2020, 06:50 WIB",
                                    style: TextStyle(
                                        color: ColorUtil.primaryColor
                                            .withOpacity(0.2),
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal
                                    )
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailNewsPage())),
                    );
                  },
                )),
            Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                width: 50,
                padding: EdgeInsets.all(10),
                child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
