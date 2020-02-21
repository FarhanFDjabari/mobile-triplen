import 'package:flutter/material.dart';
import 'package:triplen_app/utils/color_util.dart';

class TopUpPage extends StatefulWidget {
  TopUpPage({Key key}) : super(key: key);

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Top Up Credit",
          style: TextStyle(
              fontSize: 18,
              color: ColorUtil.secondaryColor,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: ColorUtil.secondaryColor,
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 65),
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: ColorUtil.secondaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0XFFD3D6DA).withAlpha(50),
                        offset: Offset(0, 2),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ]),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 250),
                    child: Text(
                      "Jumlah Credit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.monetization_on,
                          color: Colors.yellowAccent,
                          size: 35,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "3923",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 45),
                    child: Text(
                      "Silahkan pilih paket topup di bawah ini",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.only(top: 15),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        width: 90,
                        height: 60,
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("Top Up $index",
                                        style: TextStyle(
                                            color: ColorUtil.primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    Container(
                                      margin: EdgeInsets.only(left: 200,),
                                      child: Icon(
                                        Icons.monetization_on,
                                        color: Colors.yellow,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      "5000",
                                      style: TextStyle(
                                          color: ColorUtil.primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
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
