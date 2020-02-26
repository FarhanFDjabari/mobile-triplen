import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triplen_app/utils/color_util.dart';

class KontakKami extends StatelessWidget {
  KontakKami({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.4,
                color: ColorUtil.secondaryColor,
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
                          child: Text(
                            'Kontak Kami',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Social Media',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset('assets/instagram.svg', width: 40, height: 40,),
                                Text(
                                  '@Triplen.id',
                                  style: TextStyle(
                                    color: ColorUtil.secondaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Hotline',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SvgPicture.asset('assets/phone.svg', width: 25, height: 25, color: ColorUtil.secondaryColor,),
                                    Text(
                                      '  +62 822 3431 9145',
                                      style: TextStyle(
                                        color: ColorUtil.secondaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    SvgPicture.asset('assets/phone.svg', width: 25, height: 25, color: ColorUtil.secondaryColor,),
                                    Text(
                                      '  +62 812 3456 7890',
                                      style: TextStyle(
                                        color: ColorUtil.secondaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SvgPicture.asset('assets/email.svg', width: 25, height: 25, color: ColorUtil.secondaryColor,),
                                    Text(
                                      '  Triplen-app@gmail.com',
                                      style: TextStyle(
                                        color: ColorUtil.secondaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
//      floatingActionButton: Row(
//        crossAxisAlignment: CrossAxisAlignment.end,
//        mainAxisAlignment: MainAxisAlignment.end,
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.only(right: 5),
//            child: FloatingActionButton(
//              backgroundColor: ColorUtil.secondaryColor,
//              onPressed: () {},
//              elevation: 1,
//              hoverElevation: 1,
//              focusElevation: 1,
//              highlightElevation: 1,
//              disabledElevation: 0,
//              splashColor: Colors.transparent,
//              foregroundColor: Colors.transparent,
//              hoverColor: Colors.transparent,
//              child: SvgPicture.asset('assets/instagram.svg', color: Colors.white,),
//            ),
//          ),
//          Container(
//            child: FloatingActionButton(
//              backgroundColor: ColorUtil.secondaryColor,
//              onPressed: () => launch("tel://6285230026622"),
//              elevation: 1,
//              hoverElevation: 1,
//              focusElevation: 1,
//              highlightElevation: 1,
//              disabledElevation: 0,
//              splashColor: Colors.transparent,
//              foregroundColor: Colors.transparent,
//              hoverColor: Colors.transparent,
//              child: SvgPicture.asset('assets/phone.svg', color: Colors.white,),
//            ),
//          ),
//        ],
//      ),
    );
  }
}
