import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triplen_app/utils/color_util.dart';

class PremiumPage extends StatelessWidget {
  PremiumPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 3.4,
                decoration: BoxDecoration(
                    color: ColorUtil.secondaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                ),
                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 35, horizontal: 8),
                          child: InkWell(
                            child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                color: Colors.white,
                                onPressed: () => Navigator.pop(context)),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Akses Premium Hanya',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Rp 15.000 perbulan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 35),
                  width: MediaQuery.of(context).size.width/1.2,
                  height: MediaQuery.of(context).size.height/2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                              width: 15.0,
                              height: 15.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: ColorUtil.secondaryColor)),
                          Container(
                            child: Text(
                              'Buat board tak terbatas',
                              style: TextStyle(
                                fontSize: 18, color: ColorUtil.secondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                              width: 15.0,
                              height: 15.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: ColorUtil.secondaryColor)),
                          Container(
                            child: Text(
                              'Akses semua riwayat board',
                              style: TextStyle(
                                fontSize: 18, color: ColorUtil.secondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                              width: 15.0,
                              height: 15.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: ColorUtil.secondaryColor)),
                          Container(
                            child: Text(
                              'Bagikan board ke temanmu',
                              style: TextStyle(
                                fontSize: 18, color: ColorUtil.secondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                              width: 15.0,
                              height: 15.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: ColorUtil.secondaryColor)),
                          Container(
                            child: Text(
                              'Kontak layanan 24 jam',
                              style: TextStyle(
                                fontSize: 18, color: ColorUtil.secondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
          onTap: (){},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorUtil.secondaryColor),
            child: Text(
              "Beli Akses Premium",
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