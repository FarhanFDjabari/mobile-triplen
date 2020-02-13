import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triplen_app/utils/color_util.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 25),
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset('assets/logo-light.png'),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Profil",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 75,
                          width: 75,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0XFF64CEFF), width: 3),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Nabila Putri Syafrina",
                              style: TextStyle(
                                color: ColorUtil.primaryColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "nabilasyafrina@gmail.com",
                              style: TextStyle(
                                  color: ColorUtil.greyColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            print("cihuy");
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Color(0XFFD8D8D8), width: .5),
                                bottom: BorderSide(color: Color(0XFFD8D8D8), width: .5),
                              )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Top up credit",
                                  style: TextStyle(
                                      color: Color(0XFFA1A1A1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal
                                  ),
                                ),
                                Icon(Icons.chevron_right, color: ColorUtil.greyColor,)
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Color(0XFFD8D8D8), width: .5),
                                  bottom: BorderSide(color: Color(0XFFD8D8D8), width: .5),
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                      color: Color(0XFFA1A1A1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                                Icon(Icons.chevron_right, color: ColorUtil.greyColor,)
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Color(0XFFD8D8D8), width: .5),
                                  bottom: BorderSide(color: Color(0XFFD8D8D8), width: .5),
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Tentang Aplikasi",
                                  style: TextStyle(
                                      color: Color(0XFFA1A1A1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                                Icon(Icons.chevron_right, color: ColorUtil.greyColor,)
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Color(0XFFD8D8D8), width: .5),
                                  bottom: BorderSide(color: Color(0XFFD8D8D8), width: .5),
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Kontak Kami",
                                  style: TextStyle(
                                      color: Color(0XFFA1A1A1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                                Icon(Icons.chevron_right, color: ColorUtil.greyColor,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
