import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(
        title: Text(
          "Liburan Ke Bali",
          style: TextStyle(
              fontSize: 18,
              color: ColorUtil.primaryColor,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: ColorUtil.primaryColor,
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
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
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Belum Selesai",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorUtil.primaryColor,
                          ),
                            child:
                            Icon(Icons.add, color: Colors.white,)
                        ),
                      )

                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.only(top: 15),
                    child: ListView.builder(
                      itemCount: 9,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
                                        shape: BoxShape.circle,
                                        color: ColorUtil.greenColor)),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Liburan Ke Bali $index",
                                      style: TextStyle(
                                          color: ColorUtil.primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  Text("Liburan mulai tanggal 30 Januari",
                                      style: TextStyle(
                                          color: ColorUtil.greyColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Done",
                                  style: TextStyle(
                                      color: ColorUtil.primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Sudah Selesai",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.only(top: 15),
                    child: ListView.builder(
                      itemCount: 9,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
                                        shape: BoxShape.circle,
                                        color: ColorUtil.greenColor)),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Liburan Ke Bali $index",
                                      style: TextStyle(
                                          color: ColorUtil.primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  Text("Liburan mulai tanggal 30 Januari",
                                      style: TextStyle(
                                          color: ColorUtil.greyColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Done",
                                  style: TextStyle(
                                      color: ColorUtil.primaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: ColorUtil.greyColor,
            offset: Offset.fromDirection(3.0)
          )
        ]),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorUtil.primaryColor),
            child: Text(
              "Selesai Melakukan Perjalanan",
              style:
                  TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
